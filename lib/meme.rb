require 'json'
require 'net/http'


def get_templates
  url = 'http://memegen.link/templates/'
  JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
end

def list_templates
  get_templates.inject(get_templates){ |h, (k, v)| h[k] = v.split('/').last; h }.invert
end
