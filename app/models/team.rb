class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo

  field :name, type: String
  field :players, type: String
  field :description, type: String
  field :short_name, type: String

  field :short_description, type: String

  attr_accessible :name, :players, :description, :short_description, :tournaments, 
    :tournament_ids, :short_name

  has_many :team_photos

  has_many :home_matches, class_name: "Match", inverse_of: "playera"
  has_many :guest_matches, class_name: "Match", inverse_of: "playerb"

  has_many :standings

  has_and_belongs_to_many :tournaments

  validates :name, :description, :short_description, :short_name , :presence => true

  searchable do
    text :name
    text :players
  end

  def main_image
    team_photos.first
  end
end
