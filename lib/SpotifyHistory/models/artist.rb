module SpotifyHistory
  class Artist
    attr_accessor :name, :spotify_id, :musicbrainz_id

    def initialize; end

    def spotify_url
      "https://open.spotify.com/artist/#{spotify_id}"
    end

    def to_h
      {
          name: name,
          spotify_id: spotify_id,
          musicbrainz_id: musicbrainz_id
      }
    end
  end
end
