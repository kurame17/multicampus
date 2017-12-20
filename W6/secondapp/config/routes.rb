Rails.application.routes.draw do
  root 'post#index'

  get 'post/index'

  get 'post/new'

  post 'post/create'
  
  get 'post/show/:id' => 'post#show'  # id를 매개변수로 전달하며 컨트롤러의 show def로 보냄

  delete 'post/destroy/:id' => 'post#destroy'

  get 'post/modify/:id' => 'post#modify'

  post 'post/update/:id' => 'post#update'
end
