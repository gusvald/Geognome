class Gnome < ApplicationRecord
def full_address
	""
end
validates :gnome_name, presence: true, uniqueness: true, length: { in: 3..50 }
validates :g_description, presence: true
validates :location_x, presence: true
validates :location_y, presence: true
belongs_to :route
has_and_belongs_to_many :profiles, through: :likes

geocoded_by :location, location_x: :lat, location_y: :lon
reverse_geocoded_by :location_x, :location_y
end