require 'csv'

module Service
  class Generate < BaseService
    def call
      file = CSV.open(@file.path, 'wb') do |row|
        row << headers
        @collection.each do |result|
          row << result.data
        end

        row
      end

      file.close

      ::Result.where(id: @collection.pluck(:id)).destroy_all

      file.path
    end

    private

    attr_reader :collection, :file

    def initialize(**)
      @collection = ::Result.all
      @file = Tempfile.new([DateTime.new.to_s, '.csv'])
    end

    def headers
      %w[ID LeadID LeadType AgentName CreationDate FinishDate Result Comment ApplicationNumber].freeze
    end
  end
end