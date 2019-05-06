class RefreshTokenJob < ApplicationJob
  queue_as :default

  def perform
    Service::Refresh.call
  end
end