Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Home page
  root "home#index"
  get 'home/index'

  # STUDENT ROUTES
  get '/students/dashboard', to: 'students#dashboard', as: 'students_dashboard'
  get '/students/eval_form', to: 'students#eval_form', as: 'eval_form'
  get '/students/presenter_feed', to: 'students#presenter_feed', as: 'presenter_feed'
  post '/students/evaluations', to: 'students#create_evaluation', as: 'student_evaluations'

  # Student Evaluation routes
  get '/student_evaluations/new', to: 'students#eval_form', as: 'new_student_evaluation'

  # INSTRUCTOR ROUTES
  get '/instructors/dashboard', to: 'instructors#dashboard', as: 'instructors_dashboard'
  get '/instructors/all_eval', to: 'instructors#all_eval', as: 'all_eval'
  get '/instructors/individ_eval', to: 'instructors#individ_eval', as: 'individ_eval'
  get '/instructors/create_event', to: 'instructors#create_event', as: 'create_event'
  get '/instructors/new_evaluation', to: 'instructors#new_evaluation', as: 'new_evaluation'
  post '/instructors/evaluations', to: 'instructors#create_evaluation', as: 'create_evaluation'
  get '/instructors/events', to: 'instructors#events', as: 'events'
  post '/instructors/events', to: 'instructors#events'
  delete '/instructors/events/:id', to: 'instructors#destroy_event', as: 'delete_event'
  get '/instructors/roster', to: 'instructors#roster', as: 'roster'
  post '/instructors/save_grades', to: 'instructors#save_grades', as: 'save_grades'
  patch 'instructors/event_presenters/:id/grade', to: 'instructors#update_grade', as: 'update_grade'  

  # POSTS 
  resources :posts

  # Rails health check
  get "up", to: "rails/health#show", as: :rails_health_check
end
