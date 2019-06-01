Rails.application.routes.draw do
  resources :relationships
  resources :user_topics
  resources :question_topics
  resources :topics
  resources :answers
  resources :questions
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
