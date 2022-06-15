class Profile < ApplicationRecord
validates :title, presence: true
belongs_to :user
belongs_to :role
belongs_to :route
has_and_belongs_to_many :gnomes, through: :likes
end
