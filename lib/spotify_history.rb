require 'open-uri'
require 'json'
require 'base64'
require 'json'
require 'rest-client'
require 'yaml'
require 'rexml/document'

module SpotifyHistory
  ROOT_DIR = File.expand_path('..', __dir__)

  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'core')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'spotify')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'musicbrainz')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'store')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'models', 'artist')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'services', 'get_known_artists')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'services', 'get_recent_artists')
  require File.join(ROOT_DIR, 'lib', 'SpotifyHistory', 'services', 'get_musicbrainz_id')

  CONFIG_DIR = File.join(ROOT_DIR, 'config')
  CONFIG = YAML.load_file File.join(CONFIG_DIR, 'main.yaml')

  def self.run(_args = {})
    Core.new.run
  end
end

SpotifyHistory.run
