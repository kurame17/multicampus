require 'sinatra'

#localhost:4567
get '/' do 
    "Hello world!"
end

#localhost:4567/welcome
get '/welcome' do
    send_file 'welcome.html'
end