class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.string :ancestry
      t.string :content

      t.timestamps
    end
    add_index :post_comments, :ancestry
  end
end
