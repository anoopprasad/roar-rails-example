RoarRailsExample::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'
  resources :employees
  match 'employees(.:format)' => 'employees#create', :via => :put # allow putting without an id to act as post
  resources :companies
  match 'companies(.:format)' => 'companies#create', :via => :put # allow putting without an id to act as post
end
