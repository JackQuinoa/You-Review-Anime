class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  validates :rating, :content, :anime, presence: true
end
