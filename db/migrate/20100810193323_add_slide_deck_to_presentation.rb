class AddSlideDeckToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :slide_deck_file_name, :string
    add_column :presentations, :slide_deck_content_type, :string
    add_column :presentations, :slide_deck_file_size, :integer
    add_column :presentations, :slide_deck_updated_at, :datetime
  end

  def self.down
    remove_column :presentations, :slide_deck_updated_at
    remove_column :presentations, :slide_deck_file_size
    remove_column :presentations, :slide_deck_content_type
    remove_column :presentations, :slide_deck_file_name
  end
end
