class AddCommentsToGossips < ActiveRecord::Migration[5.2]
  def change
    add_reference :gossips, :comment, foreign_key: true
  end
end
