Rails.application.routes.draw do
  devise_for :users
  root to: 'reports#subjects'
  resources :students do
    get :subjects
  end
  get 'subjects', to: :subjects, controller: 'reports'
  get 'teachers', to: 'teachers#show', as: :teachers
end
