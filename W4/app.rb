get '/' do
    erb :index
end

# form
get '/post' do
    erb :post
end

# 결과 보여주는 곳
get '/complete' do
    @title =  params[:title]
    @content = params[:content]
    erb :complete
end