Rails.application.routes.draw do
  resources :tasks
  resources :task_schedules do
    patch :complete, on: :member
  end
  resources :users

  root to: 'users#index'
end
