class Events < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :date
      t.string :description
      t.string :location
      t.timestamps 
    end
  end

  def self.down
    drop_table :events
  end
end
