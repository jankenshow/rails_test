class RemoveUserIdFromBlogs < ActiveRecord::Migration[5.1]
  def up
    remove_column :blogs, :user_id, :integer
  end
  
  def down
    add_column :blogs, :user_id, :integer
  end
end
