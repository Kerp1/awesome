class SongsController < ApplicationController
	skip_before_action :require_login, only: [:index]
	def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
		@song = Song.new
	end

	def edit
		@song = Song.find(params[:id])
	end

	def create 
		@song = Song.new(song_params)

		if @song.save!
			redirect_to @song
		else
			render 'new'
		end
	end

	def update
		@song = Song.find(params[:id])
		oldname = @song.name
		if @song.update(song_params)
			File.rename(get_song_path(oldname), get_song_path(@song.name))
			redirect_to @song
		else
			render 'edit'
		end
	end

	def destroy
		@song = Song.find(params[:id])
		if File.exist?(get_song_path(@song.name))
			File.delete(get_song_path(@song.name))
		end
		@song.destroy

		redirect_to songs_path
	end


private
	def song_params
		params.require(:song).permit(:name, :link, :timestamp)
	end

	def get_song_path(name)
		return 'public/' + name + '.mp4'
	end

end
