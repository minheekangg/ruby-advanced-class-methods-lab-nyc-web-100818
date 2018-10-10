class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # same as running Song.all << self
    #self.class needs to be called here bc this is a class method
    #if the method was self.save then inside it it can have self.all
  end

  def self.create
    new_song = self.new #creating new INSTANCES + calling it new_song(variable)
    new_song.save #doesn't need to shovel in new instance of song bc save method already does it
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find{|each_song| each_song.name == song_name}
    #teach Person class how to search by defining a class method:
  end

  def self.find_or_create_by_name(song)
      if self.find_by_name(song) == nil
        self.create_by_name(song)
      else
        self.find_by_name(song)
      end
  end


  def self.alphabetical
    @@all = @@all.sort_by {|song| song.name}
    return @@all
  end

  def self.new_from_filename(title_dash_name)
    title_dash_name.slice!(".mp3")
    title_dash_name = title_dash_name.split(" - ")
    new_song = self.new
    new_song.name = title_dash_name[1]
    new_song.artist_name = title_dash_name[0]
    new_song
  end

  def self.create_from_filename(title_dash_name)
    title_dash_name.slice!(".mp3")
    title_dash_name = title_dash_name.split(" - ")
    new_song = self.new
    new_song.name = title_dash_name[1]
    new_song.artist_name = title_dash_name[0]
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
