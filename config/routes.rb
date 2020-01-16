Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'games#home'
  resources :submissions, path: "submissions/:game_code/:round", only: [:new, :create]

  resources :codes, only: [:create, :destroy]
  resources :code_users, only: [:create]
  delete 'end-game', to: 'codes#destroy_all'
  resources :games do
    collection do
      put :update_guessingRound
    end

  end

  get 'game-lobby', to: 'games#gameLobby'
  get 'guessing-round', to: 'games#guessingRound'

end
