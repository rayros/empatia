class ChangeDetailsToPosts < ActiveRecord::Migration
  def change 
    Post.update_all({comment_count: 0}, {comment_count: nil})
    Post.update_all({like_count: 0}, {like_count: nil})
    Post.update_all({share_count: 0}, {share_count: nil})
    Post.update_all({total_count: 0}, {total_count: nil})
    change_column :posts, :comment_count, :integer, default: 0, null: false
    change_column :posts, :like_count, :integer, default: 0, null: false
    change_column :posts, :share_count, :integer, default: 0, null: false
    change_column :posts, :total_count, :integer, default: 0, null: false
  end
end
