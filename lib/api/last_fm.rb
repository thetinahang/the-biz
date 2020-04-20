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
      artist = replace_spaces(@artist)
      track = replace_spaces(@track)
      check_domain(artist, track)
    end

    def replace_spaces(string)
      if string.include?(' ')
        new_value = string.gsub(' ', '%20')
      end
      new_value
    end 

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