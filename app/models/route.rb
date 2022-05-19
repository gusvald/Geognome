class Route < ApplicationRecord
validates :route_name, presence: true, uniqueness: true
has_many :profiles
end
