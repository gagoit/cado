class Tournament
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Sunspot::Mongo

  field :name, type: String
  field :description, type: String
  field :start_time, type: Time
  field :end_time, type: Time

  field :short_description, type: String

  attr_accessible :name, :start_time, :end_time, :description, :short_description, :team_ids, :teams

  validates :name, :start_time, :end_time, :description, :short_description , :presence => true

  has_many :matches
  has_many :standings
  has_and_belongs_to_many :teams
  has_many :tournament_photos

  has_many :groups, order: [:name, :asc]

  validate do
    # if start_time && end_time && start_time > end_time
    #   self.errors.add(:end_time, "must be greater than start time")
    #   return false
    # end
  end

  searchable do
    text :name
  end

  def main_image
    tournament_photos.first
  end

  def self.upcomming
    current_time = Time.now.utc
    self.where(:start_time.gt => current_time)
  end

  def self.current
    current_time = Time.now.utc
    self.where(:start_time.lte => current_time, :end_time.gte => current_time)
  end

  def self.in_past
    current_time = Time.now.utc
    self.where(:end_time.lt => current_time)
  end
end
