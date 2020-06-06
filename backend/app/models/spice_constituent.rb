class SpiceConstituent < ApplicationRecord
  belongs_to :spice
  belongs_to :constituent
end
