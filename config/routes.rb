Rails.application.routes.draw do
  namespace :api do
      get '/activities', :to => 'activities#index'
      get '/activities/:id', :to => 'activities#show'
      get '/babies', :to => 'babies#index'
      get '/babies/:id/activity_logs', :to => 'babies#baby_activity_logs'
      post '/activity_logs', :to => 'activitylogs#create'
      put '/activity_logs/:id', :to => 'activitylogs#update'
  end

  end
