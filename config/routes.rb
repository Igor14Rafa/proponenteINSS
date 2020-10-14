Rails.application.routes.draw do
  get 'proponentes/get_desconto', :to => 'proponentes#get_desconto' 
  resources :proponentes 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
