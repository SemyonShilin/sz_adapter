class PutFileJob < ApplicationJob
  queue_as :default

  def perform
    file = Service::Generate.call
    Service::Put.call(file: file)
  end
end