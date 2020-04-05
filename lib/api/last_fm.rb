module Api

  class LastFm

    include HTTParty

    def self.get_response
      response = HTTParty.get(build_auth_url)
      response.body
    end

    def build_auth_url
      @auth_url ||= lastfm_auth_url + api_key
    end

    def lastfm_auth_url
      'http://www.last.fm/api/auth/?api_key='
    end

    def api_key
        ENV[“LASTFM_API_KEY”]
    end  
  end

end