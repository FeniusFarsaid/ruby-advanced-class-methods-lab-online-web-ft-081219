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
    song = self.new
    song.save
    song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end   
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  #Runs one or the other. Cannot not run both.
  

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end 
  
  def self.new_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split(" - ")[1].split(".")[0]
    new_song.artist_name = filename.split(" - ")[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split(" - ")[1].split(".")[0]
    new_song.artist_name = filename.split(" - ")[0]
    @@all << new_song
  end 
  
  # def self.destroy_all
  #   @@all =[]
  # end
  #Also works
  
  def self.destroy_all
      @@all.clear
  end
  
end 

  










