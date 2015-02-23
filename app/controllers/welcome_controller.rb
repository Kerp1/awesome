class WelcomeController < ApplicationController
  def index
  	songs = Song.all
  	songArray = Array.new
  	songs.each do |s|
  		songArray.push(s.id)
  	end

  	number = rand(songArray.length)
  	songId = songArray.at(number)
  	@song = Song.find(songId)

   end
end
