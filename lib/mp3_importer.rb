require 'pry'

class MP3Importer

  attr_reader :path


  def initialize(path)
    @path = path

  end

  def self.all
    @@all
  end

  ## --------------- end Class methods

  ## --------------- start instnace methods

  def files
    Dir.entries(@path).delete_if { |i| !i.end_with?("mp3") }
  end

  #import - Since we have to send the filenames to the Song class,
  #we'll end up calling the following code in the #import method:
  #Song.new_by_filename(some_filename)
  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end


end # end Mp3Importer class
