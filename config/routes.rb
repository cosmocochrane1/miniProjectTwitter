Rails.application.routes.draw do
  root to: 'application#index'
  post 'search' => 'sentiments#search'
  post 'twittersearch' => 'sentiments#twittersearch'
end
