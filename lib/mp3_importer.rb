require "pry"
class MP3Importer
  attr_reader :path
  def initialize(path)
    @path = path 
  end 
  def files
    f_list = Dir.entries(@path).sort
    f2 = f_list.select {|entry| entry.include?(".mp3")}
    f2
  end
end 