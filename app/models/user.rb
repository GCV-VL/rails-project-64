# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, class_name: 'Post', dependent: :destroy, inverse_of: :creator
  has_many :likes, class_name: 'PostLike', dependent: :destroy, inverse_of: :user
end
