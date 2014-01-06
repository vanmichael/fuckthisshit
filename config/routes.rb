Fuckthisshit::Application.routes.draw do
  get 'images/:id/next' => 'images#next'
  get 'images/:id/previous' => 'images#previous'
  get 'images/:id' => 'images#show', as: :image
  root 'images#index'
end
