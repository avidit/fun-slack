require 'sinatra'

not_found do
	'Seems like you are lost'
end

get '/status' do
  'Running OK'
end
