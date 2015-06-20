Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  resources :users, only: [:index, :show, :edit]

  resources :blogs
  resources :posts do
    post :rate, on: :member
  end
  resources :comments, only: [:create, :update]

  mount RedactorRails::Engine => '/redactor_rails'
end
