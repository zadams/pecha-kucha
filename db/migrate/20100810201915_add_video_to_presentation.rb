class AddVideoToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :video_file_name, :string
    add_column :presentations, :video_content_type, :string
    add_column :presentations, :video_file_size, :integer
    add_column :presentations, :video_updated_at, :datetime
  end

  def self.down
    remove_column :presentations, :video_updated_at
    remove_column :presentations, :video_file_size
    remove_column :presentations, :video_content_type
    remove_column :presentations, :video_file_name
  end
end
