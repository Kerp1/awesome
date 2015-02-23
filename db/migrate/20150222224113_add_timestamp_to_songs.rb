class AddTimestampToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :timestamp, :string
  end
end
