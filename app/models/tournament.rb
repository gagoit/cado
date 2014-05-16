class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Sunspot::Mongo

  field :name, type: String
  field :description, type: String
  field :start_time, type: DateTime
  field :end_time, type: DateTime

  attr_accessible :name, :start_time, :end_time, :description

  has_many :matches
  has_many :standings
  has_many :teams
  has_many :tournament_photos

  searchable do
    text :name
  end

end
