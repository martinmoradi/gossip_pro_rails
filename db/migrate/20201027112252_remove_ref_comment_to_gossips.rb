class RemoveRefCommentToGossips < ActiveRecord::Migration[5.2]
  def change
    remove_column :gossips, :comment_id
  end
end
