class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo

  field :name, type: String
  field :players, type: String

  attr_accessible :name, :players

  has_many :team_photos

  has_many :home_matches, class_name: "Match", inverse_of: "playera"
  has_many :guest_matches, class_name: "Match", inverse_of: "playerb"

  has_many :standings

  searchable do
    text :name
    text :players
  end
end
