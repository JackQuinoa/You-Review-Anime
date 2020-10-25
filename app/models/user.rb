class User < ApplicationRecord
    has_many :reviews
    has_many :anime, through: :reviews

    validates :username, uniqueness: true, presence: true
    
    has_secure_password 
end
