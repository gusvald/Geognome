class Route < ApplicationRecord
validates :route_name, presence: true, uniqueness: true
validates :r_description, presence: true
has_many :profiles
end
