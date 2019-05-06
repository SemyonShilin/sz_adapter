require 'faraday'

module Service
  class Refresh < BaseService
    def call

      conn = Faraday.new(ENV['SZ_HOST'], ssl: { verify: false }) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        # faraday.response :logger                  # log requests and responses to $stdout
        faraday.adapter  Faraday.default_adapter  #
      end

      response =
        conn.post do |req|
          req.url '/oauth/token'
          req.headers['Authorization'] = "Bearer #{@token.access_token}"
          req.body = @data.as_json
        end

      data = HashWithIndifferentAccess.new(JSON.parse(response.body))

      @token.update(
        access_token: data[:access_token],
        refresh_token: data[:refresh_token]
      )
    end

    private

    attr_reader :data

    def initialize(_args)
      @token = Token.last

      @data = {
        grant_type: 'refresh_token',
        refresh_token: @token.refresh_token,
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET']
      }
    end
  end
end

