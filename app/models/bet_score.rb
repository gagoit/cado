class BetScore
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo

  field :scorea, type: Integer
  field :scoreb, type: Integer
  field :score, type: String

  attr_accessible :scoreb, :scorea, :match_id, :match

  belongs_to :match

  validates :scorea, :scoreb, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true}

  before_save do 
    if scorea && scoreb
      self.score = scorea.to_s + "-" + scoreb.to_s
    end
  end
end
