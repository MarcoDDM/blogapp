class RemoveDuplicateIndexFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_index :posts, :author_id
  end
end
