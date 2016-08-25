Rails.application.routes.draw do
  devise_for :users
  resources :students do
    get :subjects
  end
  get 'subjects', to: :subjects, controller: 'reports'
end
