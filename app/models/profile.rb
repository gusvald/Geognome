class Profile < ApplicationRecord
validates :title, presence: true
belongs_to :user
belongs_to :role
belongs_to :route
end
