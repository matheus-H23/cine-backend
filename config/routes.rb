Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do 
      resources :users
      resources :movies
      resources :genders
      resources :admins
    end
  end



  get "/404" => "errors#not_found"
  get "/500" => "errors#exception"

end
