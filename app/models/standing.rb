class Standing
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  field :position, type: Integer
  field :point, type: Integer
  field :played, type: Integer
  field :win, type: Integer
  field :lose, type: Integer
  field :draw, type: Integer

  attr_accessible :played, :position, :point, :win, :lose, :draw, :tournament_id, :tournament, :team, :team_id

  belongs_to :tournament
  belongs_to :team

  validates :played, :position, :point, :win, :lose, :draw, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true}

  # searchable do
  #   text :name

  #   text :team do
  #     team.name
  #   end

  #   text :tournament do
  #     tournament.name
  #   end
  # end
  search_in :name, :team => :name, :tournament => :name
end
