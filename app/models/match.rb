class Match
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sunspot::Mongo
  include Mongoid::MultiParameterAttributes

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
    :number, :group, :tournament_id

  belongs_to :playera, class_name: "Team", inverse_of: :home_matches
  belongs_to :playerb, class_name: "Team", inverse_of: :guest_matches

  has_many :match_photos

  has_many :bet_scores

  belongs_to :tournament

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

  def self.matches_in_dates(col = Match.all)
    result = {}
    match_in_date = []
    date = nil
    all_matches = col.order_by([:start_time, :asc])
    count = all_matches.count

    all_matches.each_with_index do |e, index|
      if date_equal(e.start_time, date)
        match_in_date << e

        if count == (index + 1)
          result[date] = match_in_date.dup
        end
      else
        result[date] = match_in_date.dup if date

        date = e.start_time
        match_in_date = []
        match_in_date << e

        if count == (index + 1)
          result[date] = match_in_date.dup
        end
      end
    end

    result
  end

  def self.date_equal(date1, date2)
    return false if date1.blank? || date2.blank?

    return true if date1.strftime("%d%m%Y") == date2.strftime("%d%m%Y")

    false
  end

  ##
  # before 70' of the match
  ##
  def can_bet_score
    current_utc_time = Time.now.utc + 3.hours
    if start_time + 70.minutes < current_utc_time
      false
    else
      true
    end
  end
end
