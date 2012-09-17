RoarRailsExample::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'
  resources :employees, :constraints => {:format => /json/}, :defaults => { :format => 'json' }
  resources :companies, :constraints => {:format => /json/}, :defaults => { :format => 'json' }
end
