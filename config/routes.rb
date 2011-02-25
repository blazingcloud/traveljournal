Traveljournal::Application.routes.draw do
  resources :hotels
  resources :trips

  root :to => "hotels#index"
end
