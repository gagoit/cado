class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  include Mongoid::Search

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  field :name, :type => String
  field :about_me, :type => String

  field :admin, :type => Boolean, default: false

  field :lose, type: Float, default: 0.0
  field :win, type: Float, default: 0.0
  field :paid, type: Float, default: 0.0

  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin, :google]

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :about_me, 
      :avatar, :avatar_cache, :admin, :lose, :win, :paid

  validates :email, :presence => true, :uniqueness => {:case_sensitive => false}

  has_mongoid_attached_file :avatar, styles: {  large: ["1024", :jpg],
                                                :medium   => ['250x250',    :jpg],
                                                :small    => ['70x70#',   :jpg],
                                                thumb: ["100x100#", :jpg] },
                                  convert_options: {all: ["-unsharp 0.3x0.3+5+0", "-quality 90%", "-auto-orient"]},
                                  processors: [:thumbnail] ,
                                  default_url: "/assets/no-avatar.jpg",
                                  storage: :filesystem

  validates_attachment_content_type :avatar, :content_type => %w[image/png image/jpg image/jpeg image/gif]

  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  field :remember_me, :type => Boolean

  has_many :providers, dependent: :delete

  has_many :posts
  has_many :comments

  has_many :friendships

  has_many :bet_scores

  scope :members, where(:admin.ne => true, :email.ne => "vuongtieulong02@gmail.com")

  # searchable do
  #   text :name
  #   text :email
  # end

  search_in :name, :email

  validate(:on => :create) do |user|
    if !user.email.blank?
      errors.add(:email, 'Invalid domain for email address. Email must has domain @elarion.com') unless user.email[/@elarion.com$/]
    end
  end

  ##
  # Get Avatar of a User
  ##
  def avatar_url(style = :small)
    if avatar_file_name
      avatar.url(style)
    else
      url = avatar.url(style)
      providers.each do |e|
        next unless e.image_url

        url = e.image_url
      end
      url
    end
  end

  ##
  # Dynamically create find_for_facebook_oauth and find_for_twitter_oauth methods
  [:facebook, :twitter, :linkedin, :google].each do |mode|
    class_eval <<-RUBY_EVAL
      def self.find_for_#{mode}_oauth(omniauth_param, current_user=nil)
        data = JSON.parse(omniauth_param.to_json)

        if current_user # Invite Friends || Connect
          pro = Provider.find_or_create(data, current_user)

          current_user
        else
          user_fb = {
            email: data['info']['email'],
            first_name: data['info']['first_name'],
            last_name: data['info']['last_name'],
            name: data['info']['nickname'] || "wb#{Devise.friendly_token[0,8]}"
          }

          if p = Provider.where(:uid => data['uid'], provider: data['provider']).first
            return p.user
          else
            return User.new(user_fb)
          end

          if user_fb[:email].blank?
            return nil
          elsif user = User.where(:email => user_fb[:email]).first
            user.update_attributes(user_fb)

          else # Create a user with a stub password. 
            user_fb[:password] = Devise.friendly_token[0,20]
            user = User.create(user_fb )
          end

          Provider.find_or_create(data, user)

          user
        end
      end
    RUBY_EVAL
  end

  ##
  # Get List of friendships of a User
  # @return {Array} friendships
  # @author DatPB
  ##
  def friendships
    fs = Friendship.any_of({inviter_id: self.id}, {invitee_id: self.id})
  end

  ##
  # Get List of friend ids of a User
  # @return {Array} friends ids
  # @author DatPB
  ##
  def friend_ids
    @friend_ids_cache ||= nil

    if @friend_ids_cache.nil?
      @friend_ids_cache=[]

      friendships.completed.each do |fs|
        if fs.inviter_id == self.id
          @friend_ids_cache << fs.invitee_id
        else
          @friend_ids_cache << fs.inviter_id
        end
      end
    else
      @friend_ids_cache
    end
  end

  ##
  # Get List of not_confirm friend ids of a User
  # @return {Array} friends ids
  # @author DatPB
  ##
  def friend_ids_not_confirm
    @friend_ids_not_confirm_cache ||= nil

    if @friend_ids_not_confirm_cache.nil?
      @friend_ids_not_confirm_cache=[]

      friendships.not_completed.each do |fs|
        if fs.inviter_id == self.id
          @friend_ids_not_confirm_cache << fs.invitee_id
        else
          @friend_ids_not_confirm_cache << fs.inviter_id
        end
      end
    else
      @friend_ids_not_confirm_cache
    end
  end

  ##
  # Get List of friends of a User
  # @return {Array} friends ids
  # @author DatPB
  ##
  def friends
    @friends_cache ||= User.find(friend_ids)

    @friends_cache
  end

  ##
  # Check a User is friend with user(self)
  # @return {Boolean} true/false
  # @author DatPB
  ##
  def is_friend?(user_id)
    user_id = BSON::ObjectId(user_id) unless user_id.is_a?(BSON::ObjectId)
    friend_ids.include?(user_id)
  end

  ##
  # Check the user(self) has not completed friendship with a user or not
  # @return {Boolean} true/false
  # @author DatPB
  ##
  def not_completed_friend?(user_id)
    user_id = BSON::ObjectId(user_id) unless user_id.is_a?(BSON::ObjectId)
    friend_ids_not_confirm.include?(user_id)
  end

  ##
  # Auto calculate money for each user
  ##
  def calculate_money
    return_data = {lose: 0.0, win: 0.0}
    
    self.bet_scores.each do |e|
      if e.match.result && e.match.result == e.score
        return_data[:win] += e.money
      else
        return_data[:lose] += e.money
      end
    end

    self.update_attributes({lose: return_data[:lose], win: return_data[:win]})
  end

  ##
  # Auto calculate money for users
  ##
  def self.calculate_money(user_ids = nil)
    if user_ids
      users = User.find(user_ids)
    else
      users = User.members
    end

    users.each do |u|
      u.calculate_money
    end
  end
end
