require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

set :bind, '0.0.0.0' # 가상환경에서 localhost 사용 위한 설정임

# 객체 관계 매핑 ORM 시작
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String # 짧은 글자들
  property :content, Text   # 더 많은 글자
  property :created_at, DateTime
end

DataMapper.finalize # 설정 끝

Post.auto_upgrade! # SQL Table 생성

# 루트
get '/' do
    @posts= Post.all.reverse
    erb :index
end

# 게시글을 입력 가능한 곳
get '/new' do
    erb :new
end

# 게시글 입력 완료 시
get '/create' do
    @title = params[:title]
    @content = params[:content]
    Post.create(title: @title, content: @content)
    redirect '/'
end

# id를 통해 개별 포스트 보기
# id는 인덱스에서 클릭 시 받아옴
get '/posts/:id' do
    @post = Post.get(params[:id])
    erb :posts
end
  
get '/destroy/:id' do
    @post = Post.get(params[:id])
    @post.destroy
    redirect '/'
end

# CRUD - 'U'
# 1. 사용자에게 form을 입력받는 창
get '/edit/:id' do
    @post = Post.get(params[:id])
    erb :edit
end
  
# 2. 실제로 db에 저장
get '/update/:id' do
    post = Post.get(params[:id])
    post.update(:title => params[:title], :content => params[:content])
    redirect '/'
end

get '/welcome/:name' do
    @name = params[:name]
    erb :welcome
end