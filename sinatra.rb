require 'sinatra'

#localhost:4567
get '/' do 
    send_file 'index.html'
end

#localhost:4567/welcome
get '/welcome' do
    send_file 'welcome.html'
end

#name은 파라미터
get '/welcome/:name' do
    @name = params[:name]   # 주소로부터 인수 전달받음.
    erb :welcome    #  views 폴더의 welcome.erb로 @name 전달
end

#erb는 views 폴더에서 가져온다.
get '/6' do
    erb :hello
end

get '/lotto' do
    @lotto = (1..45).to_a.sample(6)
    erb :lotto
end

get '/search' do
    erb :search
end

get '/google' do
    @q = params[:q]
    @name = params[:n]
    erb :google
end
    