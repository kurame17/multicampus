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
    
get '/lunch' do
    @lunch = ["멀캠20층", "순남시래기", "명동칼국수", "시골집", "강남목장"].sample
    @img_url = {
        "멀캠20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20987024_1431422050287339_2004189507347283968_n.jpg?ig_cache_key=MTU4NzUwMTg2NjEwNzc3MTI0Nw%3D%3D.2",
        "순남시래기" => "http://cfile25.uf.tistory.com/image/235FF03455A3421504721F", 
        "명동칼국수" => "http://cfs11.tistory.com/image/1/tistory/2008/10/27/16/54/490573abca23b"
    }
    erb :lunch
end