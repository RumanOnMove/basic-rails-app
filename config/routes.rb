Rails.application.routes.draw do
  root 'home#index', as: 'root'
  get '/about-us' => 'about#index', as: 'about'
  get '/other' => 'other#index', as: 'other'
  get '/sign-up' => 'auth#register_form', as: 'register_form'
  post '/sign-up' => 'auth#registration', as: 'registration'
  get '/sign-in' => 'auth#login_form', as: 'login_form'
  post '/sign-in' => 'auth#login', as: 'login'
  delete '/logout' => 'auth#logout', as: 'logout'
end
