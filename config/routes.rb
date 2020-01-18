Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'games#home'
  resources :submissions, path: "submissions/:game_code/:round", only: [:new, :create]

  resources :codes, only: [:create, :destroy]
  resources :code_users, only: [:create]
  resources :games do
    collection do
      put :update_guessingRound
      put :update_guessingRoundMidRound
      delete :end_game
    end
  end

  get 'select-a-thing', to: 'games#selectAThing'

  get 'game-lobby', to: 'games#gameLobby'
  get 'guessing-round', to: 'games#guessingRound'

  resources :code_things, only: [:create, :update]
  resources :things, only: [:new, :create, :index]

end
