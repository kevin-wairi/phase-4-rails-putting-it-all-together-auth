class User < ApplicationRecord
    has_many :recipes
    has_secure_password

    validates :username,presence: true,uniqueness: true
end
