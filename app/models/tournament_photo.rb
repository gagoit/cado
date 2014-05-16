class TournamentPhoto < Photo

  field :main_image, type: Boolean

  attr_accessible :main_image, :tournament, :tournament_id

  belongs_to :tournament
end