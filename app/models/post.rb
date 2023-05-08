# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :body, length: { minimum: 50 }
  validates :title, :body, presence: true

  scope :by_recently_created, -> { order(created_at: :desc) }

  def find_like(user)
    likes.find { |like| like.user_id == user.id }
  end
end
