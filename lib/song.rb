require "pry"


class Song
    attr_reader(:name, :artist, :genre)
    @@count = 0
    @@artists = []
    @@genres = []
    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@artists << artist
        @@genres << genre
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        @@genres.group_by(&:itself).map {|k, v| [k, v.count]}.to_h
    end

    def self.artist_count
        @@artists.group_by(&:itself).map {|genre, value| [genre, value.count]}.to_h
    end
end

#binding.pry