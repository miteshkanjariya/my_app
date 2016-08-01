Rails.application.routes.draw do
  resources :products
  #resources :payment_notification
  post "/payment_notification" => "payment_notification#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
