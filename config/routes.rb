Rails.application.routes.draw do
  resources :ripples, except: [:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/setPosition", :to=>"ripples#setPosition"
  post "/changePosition", :to=>"ripples#changePosition"
end
