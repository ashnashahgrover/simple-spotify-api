Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end

#afte rupdating this file check postman
#make a sample fetch in the terminal


#from here go postman
#terminal

#have you hit these checkpoints?
#type green lights in your file once you have
#and make the git commit "green lights with postman and sample JS fetch in terminal"
