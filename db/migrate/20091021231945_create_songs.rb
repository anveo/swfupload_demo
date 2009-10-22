class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :length_in_seconds
      t.string :track_file_name
      t.string :track_content_type
      t.integer :track_file_size
      t.timestamps
    end
  end
  
  def self.down
    drop_table :songs
  end
end
