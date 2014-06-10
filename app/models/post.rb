class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Search

  # for paiging
  extend WillPaginate::PerPage

  attr_accessible :title, :body, :created_by, :category, :main_image

  field :title, type: String
  field :body, type: String
  field :category, type: String

  has_mongoid_attached_file :main_image, styles: {  large: ["1024", :jpg],
                                                :medium   => ['250x250',    :jpg],
                                                :small    => ['70x70#',   :jpg],
                                                thumb: ["100x100#", :jpg] },
                                  convert_options: {all: ["-unsharp 0.3x0.3+5+0", "-quality 90%", "-auto-orient"]},
                                  processors: [:thumbnail] ,
                                  storage: :filesystem

  validates_attachment_content_type :main_image, :content_type => %w[image/png image/jpg image/jpeg image/gif]

  # searchable do
  #   text :title
  #   text :body

  #   text :comments do
  #     comments.map { |comment| "#{comment.body}" }
  #   end
  # end

  search_in :title, :body, :comments => :body

  belongs_to :created_by, :class_name => 'User'
  has_many :comments, :order => [[:created_at, :asc]]

  validates :title, :body , :presence => true

  scope :by_category, lambda { |category|
    where(:category => category)
  }

  def created!(user)
  	self.created_by = user
  	self.save!
  end
end
