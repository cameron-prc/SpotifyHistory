module SpotifyHistory
  class GetKnownArtists
    def self.call
      store = ::SpotifyHistory::Store.new

      store.existing_artists&.map do |entry|
        artist = Artist.new
        artist_data = entry[1]

        artist.name = artist_data["name"]
        artist.spotify_id = artist_data["spotify_id"]
        artist.musicbrainz_id = artist_data["musicbrainz_id"]

        artist
      end || []
    end
  end
end
