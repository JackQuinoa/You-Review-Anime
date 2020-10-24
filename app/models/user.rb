class User < ApplicationRecord
    has_many :reviews
    has_many :anime, through: :reviews
end
