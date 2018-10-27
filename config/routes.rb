Rails.application.routes.draw do
  # default_url_options :host => "localhost:3000"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :cities
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
