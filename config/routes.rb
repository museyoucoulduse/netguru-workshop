Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'

  devise_scope :user do
    authenticated :user do
      root :to => 'visitors#index', as: :authenticated_root
      resources :reports do
        get :subjects
      end
      resources :students, :teachers do
          get :subjects
      end

      get 'visitors/index'
      # get 'reports/index', action: :subject, controller: 'reports', as: :report_subjects

    end

    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
      get '/students', to: redirect('/')
      get '/teachers', to: redirect('/')
      get '/reports', to: redirect('/')
    end

    # root 'devise/sessions#new'
  end
  # get 'reports/subjects', action: :subjects, controller: 'reports', as: :report_subjects


  # get 'teachers', to: 'teachers#show', as: :teachers
end
