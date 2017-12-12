require 'sinatra'
# gem install reloader
require 'sinatra/reloader'
require 'csv'
require 'date'
require 'nokogiri'
require 'httparty'
require 'uri'

get '/' do
    erb :index
end

get '/welcome/:name' do
    @name = params[:name].to_s
    @time = Time.now.to_s
    CSV.open('user.csv', 'a+:UTF-8') do |data| # append함
        data << [@name, @time] # <<는 push 하는 것. 
        # << 할때 to_s하고 괄호[] 무적권 씌우는거 잊지 말것
        # 동시에 여러개 << 가능.
    end
    erb :welcome
end

get '/users' do
    @users = []
    CSV.foreach('user.csv', 'r:UTF-8') do |row|
        @users << row
    end
    erb :users
end

get '/vote' do
    erb :vote
end

get '/result' do
    @count = params[:count]
    erb :result
end

get '/lolfinder' do
    erb :lolfinder
end

get '/lol' do
    @username = params[:username]
    url = "http://www.op.gg/summoner/userName=#{@username}"
    url = URI.encode(url)   #멜팅탁을 인코딩 바꿔줌
    response = HTTParty.get(url)    # 크롤링함
    doc = Nokogiri::HTML(response)    # 보기 쉽게 바꿈
    @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
    @lose = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")
    erb :lol
end