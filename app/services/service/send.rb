require 'faraday'

module Service
  class Send < BaseService
    def call
      conn = Faraday.new(url: ENV['SZ_HOST'])

      conn.post do |req|
        req.url '/api/v2/leads/import'
        req.headers['Authorization'] = ENV['SZ_TOKEN']
        req.body = @data.as_json
      end
    end

    private

    attr_reader :data

    def initialize(args)
      @data = args[:data]
    end
  end
end

