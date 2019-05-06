require 'faraday'

module Service
  class Send < BaseService
    def call
      conn = Faraday.new(ENV['SZ_HOST'], ssl: { verify: false })

      conn.post do |req|
        req.url '/api/v2/leads/import'
        req.headers['Authorization'] = "Bearer #{@token.access_token}"
        req.body = @data.as_json
      end
    end

    private

    attr_reader :data

    def initialize(args)
      @data = args[:data]
      @token = Token.last
    end
  end
end

