class Song < ActiveRecord::Base
	 mount_uploader :file, SongfileUploader
	 validates :name, presence: true 
	 validates :file, presence: true
	 validates :timestamp, presence: true
end
