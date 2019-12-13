module SpotifyHistory
  class Spotify

    attr_reader :client_id, :client_secret, :user_id, :playlist_id, :refresh_token

    BASE_URL = "https://api.spotify.com/v1"
    RECENTLY_PLAYED_PATH = "/me/player/recently-played"
    REFRESH_TOKEN_URL = "https://accounts.spotify.com/api/token"

    def initialize
      @client_id = SpotifyHistory::CONFIG['account']['client_id']
      @client_secret = SpotifyHistory::CONFIG['account']['client_secret']
      @user_id = SpotifyHistory::CONFIG['account']['user_id']
      @playlist_id = SpotifyHistory::CONFIG['account']['playlist_id']
      @refresh_token = SpotifyHistory::CONFIG['account']['refresh_token']
    end

    def recent_history
      response = RestClient.get("#{BASE_URL}#{RECENTLY_PLAYED_PATH}?limit=50", authenticated_header)

      JSON.parse(response)["items"]
    end

    private

    def token
      @token ||= generate_access_token
    end

    def generate_access_token
      authorization = Base64.strict_encode64 "#{client_id}:#{client_secret}"
      headers = { 'Authorization' => "Basic #{authorization}" }
      request_body = {
          grant_type: 'refresh_token',
          refresh_token: refresh_token
      }

      response = RestClient.post(REFRESH_TOKEN_URL, request_body, headers)
      response = JSON.parse(response)

      response['access_token']
    end

    def authenticated_header
      { Authorization: "Bearer #{token}" }
    end
  end
end