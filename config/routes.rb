Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'

  resources :questions, only: [:create, :update, :destroy, :new, :edit, :index, :show] do
    resources :answers, only: [:create]
    member do
      post :add_topic
      delete :remove_topic
      get :search_topic
    end
  end

  resources :answers, only: [:update, :destroy] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:update, :destroy] do
    resources :comments, only: [:create]
  end

  resources :topics, only: [:create, :show] do
    post :follow
    delete :unfollow
  end
  resources :relationships
  resources :user_topics
  resources :question_topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
