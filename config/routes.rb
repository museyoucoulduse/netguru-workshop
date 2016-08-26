Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'
  resources :reports
  resources :students, :teachers do
    get :subjects
  end
  get 'subjects', action: :subjects, controller: 'reports', as: :report_subjects
  # get 'teachers', to: 'teachers#show', as: :teachers
end
