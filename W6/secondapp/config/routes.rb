Rails.application.routes.draw do
  root 'post#index'
  get 'post/index'

  get 'post/new'

  get 'post/create'
end
