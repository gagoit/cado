class Match
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo

  field :description, type: String
  field :name, type: String
  field :result, type: String  #teamA-teamB like 0-0, 1-0
  field :start_time, type: Time
  field :time, type: Integer, default: 90 #90 minute

  attr_accessible :name, :result, :start_time, :time, :description

  belongs_to :playera, class_name: "Team", inverse_of: :home_matches
  belongs_to :playerb, class_name: "Team", inverse_of: :guest_matches

  has_many :match_photos

  searchable do
    text :name
    text :players
  end
end
