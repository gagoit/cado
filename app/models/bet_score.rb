class BetScore
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo

  field :scorea, type: Integer
  field :scoreb, type: Integer
  field :money, type: Integer

  field :score, type: String

  attr_accessible :scoreb, :scorea, :match_id, :match, :money, :user_id

  belongs_to :match

  belongs_to :user

  validates :scorea, :scoreb, :money, :match_id, :presence => true

  validates :scorea, :scoreb, :money, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true}

  validate do 
    if money && money % 10000 != 0
      self.errors.add(:money, "must be multiple of 10,000 VND")
    end
  end

  before_save do 
    if scorea && scoreb
      self.score = scorea.to_s + "-" + scoreb.to_s
    end
  end

  scope :by_user, lambda { |user| where(:user_id => user.id) }
end
