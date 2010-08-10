class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
