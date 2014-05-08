class AddAcceptedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :accepted, :boolean, default: false, null: false
  end
end
