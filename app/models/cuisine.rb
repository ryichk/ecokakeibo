class Cuisine < ApplicationRecord
  has_many :foodstuffs
  belongs_to :meal

end
