class Spice < ApplicationRecord
	has_and_belongs_to_many :parts

	has_many :spice_constituents
	has_many :constituents, :through=>:spice_consituents
end
