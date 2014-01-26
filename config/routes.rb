EligeTuEscuela::Application.routes.draw do
  get :search, to: 'schools#search', as: :search
  root 'pages#home'
end
