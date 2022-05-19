class Gnome < ApplicationRecord
validates :gnome_name, presence: true, uniqueness: true, length: { in: 3..50 }
validates :location_x, presence: true
validates :location_y, presence: true
belongs_to :route
end
