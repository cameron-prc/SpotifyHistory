require 'firebase'

module SpotifyHistory
  class Store
    attr_reader :client

    def initialize
      base_uri = SpotifyHistory::CONFIG["database"]["url"]

      @client = Firebase::Client.new(base_uri)
    end

    def existing_artists
      client.get("artists").body
    end

    def add_artist(data)
      client.push("artists", data.merge('.priority': 1))
    end
  end
end
