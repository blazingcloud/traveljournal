Traveljournal::Application.routes.draw do
  resources :hotels
  resources :trips

  root :to => "hotels#index"
  match ":id/hotels" => "hotels#show", :via => :get, :as => :pretty_url
end
