Rails.application.routes.draw do
  root to: 'application#index'
  post 'search' => 'sentiments#search'
  get 'twittersearch' => 'sentiments#twittersearch'
  post 'fox_news' => 'sentiments#fox_news'
end
