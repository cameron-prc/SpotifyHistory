module SpotifyHistory
  class Core
    attr_reader :store

    def initialize
      @store = Store.new
    end

    def run
      artists = SpotifyHistory::GetRecentArtists.call
      existing_artists = SpotifyHistory::GetKnownArtists.call

      artists.select! do |artist|
        !existing_artists.any? do |existing_artist|
          existing_artist.spotify_id == artist.spotify_id
        end
      end

      artists.each do |artist|
        artist.musicbrainz_id = SpotifyHistory::GetMusicbrainzId.call(artist)
        store.add_artist(artist.to_h)
      end
    end
  end
end
