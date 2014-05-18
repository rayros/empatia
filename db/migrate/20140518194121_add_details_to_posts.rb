class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comment_count, :integer
    add_column :posts, :like_count, :integer
    add_column :posts, :share_count, :integer
    add_column :posts, :total_count, :integer
  end
end
