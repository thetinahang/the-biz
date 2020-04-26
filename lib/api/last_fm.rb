# frozen_string_literal: true

# This module provides the formatting and connection
# to the LastFM api. 
module Api
  class LastFm
    include HTTParty # To make HTTP requests.

    class << self
      def get_api(method, artist, track)
        new(method, artist, track)
      end
    end

    ## Initializer
    def initialize(method, artist, track)
      @method = method
      @artist = artist
      @track = track
    end

    ## Uses HTTParty to send a GET request
    ## with the desired params and API key.
    def fetch_response
      response = HTTParty.get(lastfm_url)
      JSON.parse(response.body) if response.present?
    end

    ## Format URL before placing in GET request. 
    # API Key has to be obtained beforehand.
    # Output will be in json format by default. 
    def lastfm_url
      "http://ws.audioscrobbler.com/2.0/?#{formatted_method}&#{formatted_domain}&api_key=#{ENV['LASTFM_API_KEY']}&format=json" # rubocop:disable Layout/LineLength
    end

    # Method example: 'method=artist.getsimilar'
    def formatted_method
      "method=#{@method}"
    end

    # Domain example: 'artist=cher'
    def formatted_domain
      artist = replace_spaces(@artist)
      track = replace_spaces(@track)
      check_domain(artist, track)
    end

    # Clean up method.
    #
    # Take a string and replaces spaces with '%20'.
    def replace_spaces(string)
      new_value = if string.include?(' ')
                    string.gsub(' ', '%20')
                  else
                    string
                  end
      new_value
    end

    # For any artist methods, the artist param is required.
    # For some of the track methods, the artist param 
    # may not be required but is preferred. So the method
    # will include the artist as a query param in the URL.
    #
    # Takes two 'cleaned' strings for artist and track
    # and returns the appropriate domain to be inserted
    # into the URL. 
    def check_domain(artist, track)
      pattern = '^([^.]+)'
      domain = @method.match(pattern)[0]

      if domain == 'artist'
        "#{domain}=#{artist}"
      elsif domain == 'track'
        "artist=#{artist}&#{domain}=#{track}"
      end
    end
  end
end
