class User < ApplicationRecord
    has_many :anime
    has_many :reviews, through: :anime

    validates :username, uniqueness: true, presence: true
    
    has_secure_password 
end
