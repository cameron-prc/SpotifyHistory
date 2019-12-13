module SpotifyHistory
  class Musicbrainz
    attr_reader :base_url

    BASE_URL = "https://musicbrainz.org"
    BROWSE_ENDPOINT = "/ws/2/url"

    def self.find_by(refernced_url:)
      params = {
          inc: "artist-rels",
          resource: URI.encode(refernced_url)
      }

      response = RestClient.get("#{BASE_URL}#{BROWSE_ENDPOINT}", { params: params })
      doc = REXML::Document.new(response)

      REXML::XPath.first(doc, "//artist[1]/@id")&.value
    rescue RestClient::NotFound
      nil
    end
  end
end
