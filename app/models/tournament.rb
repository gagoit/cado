class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Sunspot::Mongo

  field :name, type: String
  field :description, type: String
  field :start_time, type: DateTime
  field :end_time, type: DateTime

  field :short_description, type: String

  attr_accessible :name, :start_time, :end_time, :description, :short_description

  has_many :matches
  has_many :standings
  has_and_belongs_to_many :teams
  has_many :tournament_photos

  searchable do
    text :name
  end

  def main_image
    tournament_photos.first
  end

end
