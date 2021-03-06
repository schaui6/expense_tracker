Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :expenses
    resources :reports
  end

  root to: 'users#current_user_home'
end
