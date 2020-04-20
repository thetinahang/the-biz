module Api

  class LastFm

    include HTTParty

    class << self

      def get_api(method, artist, track)
        new(method, artist, track)
      end 

    end

    def initialize(method, artist, track)
      @method = method
      @artist = artist
      @track = track
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
      "method=#{@method}"
    end

    def formatted_domain
      if @artist.include?(' ')
        new_value = @artist.gsub(' ', '%20')
      end

      pattern = '^([^.]+)'
      domain = @method.match(pattern)[0]
      "#{domain}=#{new_value.present? ? new_value : @artist}"
    end

    def check_domain
      # track needs method, artist and track
    end

  end

end