Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"}

  resources :schools

  resources :courses do
    resources :chapters
  end
  #Progresses
  get    "chapters/read" => "progresses#show"
  post   "chapters/mark_as_complete" => "progresses#create"
  delete "chapters/mark_as_incomplete" => "progresses#delete"


  get '/my_current_user' => 'users#my_current_user'
  get '/all_users' => 'users#all_users'
  match 'users/:id' => 'users#update_user', via: [:patch]
  get '/send_password' => 'users#reset_password'
end
