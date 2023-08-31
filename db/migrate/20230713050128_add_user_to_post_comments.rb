# frozen_string_literal: true

class AddUserToPostComments < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :post_comments, :user, foreign_key: true
  end
end
