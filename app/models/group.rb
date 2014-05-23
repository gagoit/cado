class Group
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  attr_accessible :name, :tournament_id, :tournament, :teams, :team_ids

  belongs_to :tournament

  has_and_belongs_to_many :teams

  validates :name, :tournament_id, :presence => true
end
