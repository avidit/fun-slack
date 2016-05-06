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
  content_type 'application/json'
  # return 401 unless request[:token] == ENV['SLACK_TOKEN']
  status 200
  text = request[:text].strip
  command = request[:command]
  channel = request[:channel_name]

  case command

  when '/ping'
    {text: 'pong'}

  when '/gif'
    gif_url = get_gif(text)
    reply = build_slack_message('in_channel', 'gifbot', "##{channel}", nil, ':monkey:', text)
    reply['attachments'] = [{fallback: ':cry:', title: text, title_link: gif_url, image_url: gif_url}]
    reply

  when '/xkcd'
    id = text.to_i
    latest = get_xkcd['num']
    data = if (id > 0) & (id != 404) & (id <= latest)
             get_xkcd(id)
           elsif text == 'latest'
             get_xkcd
           else
             get_xkcd(rand(latest))
           end
    reply = build_slack_message('in_channel', 'xkcdbot', "##{channel}", nil, ':monkey:', '')
    reply['attachments'] = [{fallback: data['alt'], title: data['safe_title'], title_link: "http://xkcd.com/#{data['num']}/", image_url: data['img']}]
    reply

  when '/health'
    build_slack_message('ephemeral', 'Dr. Who', "##{channel}", nil, ':pill:', get_health(text))

  else
    {text: 'Unknown command :cry:'}

  end.to_json

end
