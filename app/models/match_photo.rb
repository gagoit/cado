class MatchPhoto < Photo

  field :main_image, type: Boolean

  attr_accessible :main_image, :match, :match_id

  belongs_to :match

  validates :match_id , :presence => true
end