module Api

  class LastFm

    include HTTParty

    class << self

      def get_api
        new
      end 

    end

    def get_response
      response = HTTParty.get(lastfm_url)
      JSON.parse(response.body) if response.present?
    end

    def lastfm_url
      "http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=cher&api_key=#{ENV['LASTFM_API_KEY']}&format=json"
    end

  end

end