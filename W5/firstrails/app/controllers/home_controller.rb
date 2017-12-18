class HomeController < ApplicationController
  # Controller : 모델과 뷰 사이의 중간 관리자
  # app/view/컨트롤러 이름/액션이름
  # route -> controller -> view
  def index
  end

  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @num = params[:num].to_i
  end

  def lunch
    @lunch = ["멀캠20층", "이자까야", "김밥카페"].sample
  end

  def search
    
  end

  def fakesearch
    @q = params[:q]
  end
end