Rails.application.routes.draw do
  root 'home#index', as: 'root'
  get '/about-us' => 'about#index', as: 'about'
  get '/other' => 'other#index', as: 'other'
end
