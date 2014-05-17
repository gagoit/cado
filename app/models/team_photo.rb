class TeamPhoto < Photo

  field :main_image, type: Boolean

  attr_accessible :main_image, :team, :team_id

  belongs_to :team

  validates :team_id , :presence => true
end