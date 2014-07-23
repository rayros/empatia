class ChangeDetailsToPosts < ActiveRecord::Migration
  def change 
    Post.where(comment_count: nil).update_all(comment_count: 0)
    Post.where(like_count: nil).update_all(like_count: 0)
    Post.where(share_count: nil).update_all(share_count: 0)
    Post.where(total_count: nil).update_all(total_count: 0)
    change_column :posts, :comment_count, :integer, default: 0, null: false
    change_column :posts, :like_count, :integer, default: 0, null: false
    change_column :posts, :share_count, :integer, default: 0, null: false
    change_column :posts, :total_count, :integer, default: 0, null: false
  end
end
