class Constituent < ApplicationRecord
	has_many :spice_constituents
	has_many :spices, :through=>:spice_constituents
end
