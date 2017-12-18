Rails.application.routes.draw do
  root 'home#index' # root 페이지에 들어오면 자동으로 홈 인덱스로 이동
  get 'home/index' # 자동으로 home#index로 해석해줌
  get '/lotto' => 'home#lotto'  #localhost:3000/lotto로 요청 들어오면 자동으로 home컨트롤로의 lotto로 이동
  get '/welcome/:name' => 'home#welcome' #localhost:3000/welcome로 요청 들어오면 자동으로 home컨트롤로의 welcome 이동
  get '/square/:num' => 'home#square'
  get '/lunch' => 'home#lunch'
  get '/search' => 'home#search'
  get '/fakesearch' => 'home#fakesearch'
end
