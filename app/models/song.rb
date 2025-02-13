class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre
  accepts_nested_attributes_for :genre, :notes
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content)
    end
  end


 end 
