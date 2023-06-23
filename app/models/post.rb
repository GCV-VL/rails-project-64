# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true, length: { in: 5..255 }
  validates :category, presence: true
  validates :body, presence: true, length: { in: 200..4000 }
end
