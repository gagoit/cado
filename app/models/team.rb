class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Sunspot::Mongo

  field :name, type: String
  field :players, type: String
  field :description, type: String
  field :short_name, type: String

  field :short_description, type: String

  attr_accessible :name, :players, :description, :short_description, :tournaments, 
    :tournament_ids, :short_name, :main_image

  has_many :team_photos

  has_many :home_matches, class_name: "Match", inverse_of: "playera"
  has_many :guest_matches, class_name: "Match", inverse_of: "playerb"

  has_many :standings

  has_and_belongs_to_many :tournaments

  has_and_belongs_to_many :groups

  validates :name, :description, :short_description, :short_name , :presence => true

  has_mongoid_attached_file :main_image, styles: {  large: ["1024", :jpg],
                                                :medium   => ['250x250',    :jpg],
                                                :small    => ['70x70#',   :jpg],
                                                thumb: ["100x100#", :jpg] },
                                  convert_options: {all: ["-unsharp 0.3x0.3+5+0", "-quality 90%", "-auto-orient"]},
                                  processors: [:thumbnail] ,
                                  storage: :filesystem

  validates_attachment_content_type :main_image, :content_type => %w[image/png image/jpg image/jpeg image/gif]

  searchable do
    text :name
    text :players
  end
end
