require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name name
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name name
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name name
    Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name name
    if !Song.all.find {|song| song.name == name}
      self.create_by_name name
    else
      Song.all.find {|song| song.name == name}
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename filename
    filename_array = filename.split(/\.| - /)
    song = Song.new
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    song
  end

  def self.create_from_filename filename
    filename_array = filename.split(/\.| - /)
    song = Song.new
    song.name = filename_array[1]
    song.artist_name = filename_array[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
