Fuckthisshit::Application.routes.draw do
  resources :images, only: [:show]
  root 'images#index'
end
