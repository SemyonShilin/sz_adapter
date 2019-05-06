class PutFileJob < ApplicationJob
  queue_as :put

  def perform
    file = Service::Generate.call
    Service::Put.call(file: file)
  end
end