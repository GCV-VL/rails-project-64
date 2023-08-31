# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  has_many :comments, -> { order(updated_at: :desc) }, class_name: 'PostComment', dependent: :destroy, inverse_of: :post
  has_many :likes, class_name: 'PostLike', dependent: :destroy, inverse_of: :post

  validates :title, presence: true, length: { in: 5..255 }
  validates :body, presence: true, length: { in: 200..4000 }
end
