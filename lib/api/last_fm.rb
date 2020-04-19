module Api

  class LastFm

    include HTTParty

    class << self

      def get_api(type, value)
        new(type, value)
      end 

    end

    def get_response
      response = HTTParty.get(lastfm_url)
      JSON.parse(response.body) if response.present?
    end

    def lastfm_url
      # method example - method=artist.getsimilar
      # domain example - artist=cher
      "http://ws.audioscrobbler.com/2.0/?#{method}&#{domain}&api_key=#{ENV['LASTFM_API_KEY']}&format=json"
    end

    def format_method(type)
      "method=#{type}"
    end

    def format_domain(value)
      "artist=#{value}"
    end

  end

end