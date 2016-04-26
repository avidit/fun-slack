require 'json'
require 'sinatra'

Dir["#{__dir__}/lib/*.rb"].each { |file| load file }

not_found do
  status 404
  'Seems like you are lost'
end

get '/' do
  status 200
  'Running OK'
end

post '/' do
  content_type 'application/json;charset=utf-8'
  return 401 unless request[:token] == ENV['SLACK_TOKEN']
  status 200
  text = request[:text].strip
  command = request[:command]
  channel = request[:channel_name]

  case command
  when '/gif'
    data = build_slack_message('ephemeral', 'gifbot', "##{channel}", nil, ':trollface:', text)
    data['attachments'] = [{image_url: get_gif(text)}]
    data
  when '/health'
    build_slack_message('ephemeral', 'Dr. Who', "##{channel}", nil, ':pill:', get_health(text))
  else
    {text: 'Unknown command :cry:'}
  end.to_json

end
