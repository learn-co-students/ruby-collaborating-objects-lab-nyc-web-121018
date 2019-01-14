class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize(name, artist = nil)
    @name = name
    @artist = artist

    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    file_pieces = file_name.split(" - ")
    artist_name = file_pieces[0]
    song_name = file_pieces[1]
    new_artist = Artist.new(artist_name)
    Song.new(song_name, new_artist)
    # Artist.all

  end



end
