require 'pry'

class Song

  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @artist = nil

    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    updated_name = filename.split(" - ")
    song = Song.new(updated_name[1])
    song.artist = updated_name[0]
    artist = Artist.find_or_create_by_name(updated_name[0])
    artist.songs << updated_name[1]
    song
  end

  ## --------------- end Class methods

  ## --------------- start instnace methods

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end
binding.pry
end # end Song class
