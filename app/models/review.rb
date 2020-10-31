class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  validates :rating, :content, :anime, presence: true
  validates :anime, uniqueness: {scope: :user_id, message: "may only have one review per user, please just edit your existing one."}
end
