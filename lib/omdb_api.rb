require "uri"
require "net/http"

class OmdbApi

  # Fetch movie info using OMDB API.
  def self.fetch_movie(id)
    
    url = URI("http://www.omdbapi.com/?apikey=#{ENV['OMDB_API_KEY']}&i=#{id}")

    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    return JSON.parse(response.read_body)
  end
end
