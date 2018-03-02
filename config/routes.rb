Rails.application.routes.draw do
  resources :todos
  resources :records
  get '/todos/undone/:id', to: 'todos#unDone'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
