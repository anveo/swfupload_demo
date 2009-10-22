class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    require 'mp3info'

    mp3_info = Mp3Info.new(params[:Filedata].path)

    song = Song.new
    song.artist = mp3_info.tag.artist
    song.title = mp3_info.tag.title
    song.length_in_seconds = mp3_info.length.to_i

    params[:Filedata].content_type = MIME::Types.type_for(params[:Filedata].original_filename).to_s
    song.track = params[:Filedata]
    song.save

    render :text => [song.artist, song.title, song.convert_seconds_to_time].join(" - ")
  rescue Mp3InfoError => e
    render :text => "File error"
  rescue Exception => e
    render :text => e.message
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Successfully destroyed song."
    redirect_to songs_url
  end

  private
  def convert_seconds_to_time(seconds)
    total_minutes = seconds / 1.minutes
    seconds_in_last_minute = seconds - total_minutes.minutes.seconds
    "#{total_minutes}m #{seconds_in_last_minute}s"
  end
end
