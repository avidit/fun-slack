require 'json'
require 'net/http'

def get_xkcd(id = nil)
  id ? url = "https://xkcd.com/#{id}/info.0.json" : url = 'https://xkcd.com/info.0.json'
  JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
end
