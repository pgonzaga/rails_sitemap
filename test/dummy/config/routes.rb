Rails.application.routes.draw do
  resources :articles
  resources :fakes
  namespace :trees do
    namespace :branches do
      get :leaf
    end
  end
end
