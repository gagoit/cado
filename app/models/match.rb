class Match
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo

  field :description, type: String
  field :name, type: String
  field :result, type: String  #teamA-teamB like 0-0, 1-0
  field :start_time, type: Time
  field :time, type: Integer, default: 90 #90 minute
  field :number, type: Integer
  field :group, type: String

  field :short_description, type: String

  GROUPS = ["A", "B", "C", "D"]

  attr_accessible :name, :result, :start_time, :time, :description, :short_description, :playera_id, :playerb_id,
    :number, :group

  belongs_to :playera, class_name: "Team", inverse_of: :home_matches
  belongs_to :playerb, class_name: "Team", inverse_of: :guest_matches

  has_many :match_photos

  validates :name, :start_time, :description, :short_description , :presence => true

  before_save do
    if name.blank?
      self.name = "#{playera.name}-#{playerb.name}"
    end
  end

  searchable do
    text :name
    text :playerb do
      playerb.name
    end
    text :playera do
      playera.name
    end
  end
end
