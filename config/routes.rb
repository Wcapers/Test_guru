Rails.application.routes.draw do
  get 'user/new'
  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create

  get :signup, to: 'user#new'

  resources :tests do
    resources :questions, shallow: true
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end
end
