Rails.application.routes.draw do
  get 'home/about' => 'home#about', as: 'about'
  root 'post_feelings#index'
  get 'post_feelings/index'
  devise_for :users
  resources :post_feelings, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
