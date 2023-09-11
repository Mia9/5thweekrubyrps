require 'sinatra'

get '/' do 
	erb :index
end

post '/play' do  #---<form action = put link here at index file
   #do something here
end

# post '/' do
# end




get 'hello' do
	'Hello Sinatra'
end

get '/hello/:name' do
	"Hello, #{params[:name]}"
end