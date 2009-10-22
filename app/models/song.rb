class Song < ActiveRecord::Base

  has_attached_file :track,
                    :path => ":rails_root/public/assets/:attachment/:id_partition/:id/:style/:basename.:extension",
                    :url => "/assets/:attachment/:id_partition/:id/:style/:basename.:extension"

  validates_presence_of :title, :artist, :length_in_seconds
  validates_attachment_presence :track
  validates_attachment_content_type :track, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]
  validates_attachment_size :track, :less_than => 20.megabytes

  attr_accessible :title, :artist, :length_in_seconds

  def convert_seconds_to_time
    total_minutes = length_in_seconds / 1.minutes
    seconds_in_last_minute = length_in_seconds - total_minutes.minutes.seconds
    "#{total_minutes}m #{seconds_in_last_minute}s"
  end
end
