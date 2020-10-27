class CreateTagAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_assignments do |t|
      t.references :gossip, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
