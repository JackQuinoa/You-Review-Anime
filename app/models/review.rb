class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  validates :rating, :content, :anime, presence: true
  validates :anime, uniqueness: {scope: :user_id, message: "may only have one review per user, please just edit your existing one."}

  def self.newest_reviews
    self.order(:created_at).limit(5)
  end

end
