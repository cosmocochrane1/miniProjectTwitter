Rails.application.routes.draw do
  root to: 'application#index'
  post 'search' => 'sentiments#search'
  get 'twittersearch' => 'sentiments#twittersearch'
  get 'fox_news' => 'sentiments#fox_news'

end






