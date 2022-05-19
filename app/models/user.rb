class User < ApplicationRecord
has_many :profiles
has_secure_password

validates :login, presence: true, uniqueness: true, length: { in: 3..50 }
validates :password, presence: true, length: { minimum: 6 }
end
