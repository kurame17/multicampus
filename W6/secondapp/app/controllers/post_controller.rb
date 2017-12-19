class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    # Post : 모델, posts : db의 형식.. 모델인 Post class를 이용함으로서 db에 sql문 대신 써주는 효과
    Post.create(:username => params[:username], :title => params[:title], :content => params[:content])
    # post = Post.new
    # post.username = params[:username]
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save
    redirect_to '/'
  end
end
