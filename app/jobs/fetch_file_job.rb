class FetchFileJob < ApplicationJob
  queue_as :fetch

  def perform
    Service::Fetch.call
  end
end