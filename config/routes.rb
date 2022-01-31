Rails.application.routes.draw do
  resources :shorteners

  get "/:slug" => "shorteners#redirect", as: :s

  root 'shorteners#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
