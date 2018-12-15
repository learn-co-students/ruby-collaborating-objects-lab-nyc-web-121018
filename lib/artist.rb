require 'pry'

class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.name
    self.all.map do |artist|
      artist.name
    end
  end

  ## --------------- end Class methods

  ## --------------- start instnace methods

  def add_song(song)
    self.songs << song
    new_song = Song.new(song)
    new_song.artist = self
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
      if !self.name.include?(name)
        new_artist = Artist.new(name)
      else
        self.all.find do |artist|
          artist.name == name
        end
      end
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

end # end Artist class


# a1 = Artist.new("Sammy")
# a1.add_song("Livin High")
# a1.add_song("Low life")
# a2 = Artist.new("Al")
# a3 = Artist.new("Sean")
