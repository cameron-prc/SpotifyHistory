module SpotifyHistory
  class GetRecentArtists
    def self.call
      spotify = ::SpotifyHistory::Spotify.new

      artists = spotify.recent_history.map do |track|
        artist = Artist.new

        artist.name = track["track"]["artists"].first["name"]
        artist.spotify_id = track["track"]["artists"].first["id"]

        artist
      end

      artists.uniq { |x| x.spotify_id }
    end
  end
end
