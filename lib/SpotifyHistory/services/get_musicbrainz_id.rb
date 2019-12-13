module SpotifyHistory
  class GetMusicbrainzId
    def self.call(artist)
      ::SpotifyHistory::Musicbrainz.find_by(refernced_url: artist.spotify_url)
    end
  end
end
