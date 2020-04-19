module Api

  class LastFm

    include HTTParty

    class << self

      def get_api(type, value)
        new(type, value)
      end 

    end

    def initialize(type, value)
      @type = type
      @value = value
    end

    def get_response
      response = HTTParty.get(lastfm_url)
      JSON.parse(response.body) if response.present?
    end

    def lastfm_url
      # method example - method=artist.getsimilar
      # domain example - artist=cher
      "http://ws.audioscrobbler.com/2.0/?#{formatted_method}&#{formatted_domain}&api_key=#{ENV['LASTFM_API_KEY']}&format=json"
    end

    def formatted_method
      "method=#{@type}"
    end

    def formatted_domain
      "artist=#{@value}"
    end

  end

end