class FetchFileJob < ApplicationJob
  queue_as :default

  def perform
    Service::Fetch.call
  end
end