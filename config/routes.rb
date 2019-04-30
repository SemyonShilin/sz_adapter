Rails.application.routes.draw do
  post '/api/v0/receive' => 'webhooks#receive'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
end
