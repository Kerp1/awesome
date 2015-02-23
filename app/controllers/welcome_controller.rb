class WelcomeController < ApplicationController
  def index
  	songs = Song.all
  	number = rand(songs.length) + 1
  	@song = Song.find(number)
  end
end
