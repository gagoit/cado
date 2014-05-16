class MatchPhoto < Photo

  field :main_image, type: Boolean

  attr_accessible :main_image, :match, :match

  belongs_to :match
end