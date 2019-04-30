require 'csv'

module Service
  class Parse < BaseService
    def call
      CSV.foreach(@file, encoding: 'windows-1251:utf-8') do |row|
        add_tags(row)
        add_leads(row)
      end

      Send.call(data: @parsed)
    end

    private

    attr_reader :file, :parsed

    def initialize(args)
      @file = args[:file]
      @parsed = {
        tags: [],
        data: []
      }
    end

    def add_tags(row)
      @parsed[:tags] += fetch_tags(row)
    end

    def add_leads(row)
      @parsed[:data] += {
        name: row&.fetch_values('SURNAME', 'FIRSTNAME', 'PATRONYMIC')&.join(' '),
        business: row['LeadID'],
        post: row['InformationChannel'],
        homepage: row['LeadPriority'],
        comment: row['CREATE'],
        inn: row['BIRTH_DATE'],
        phones: [row['MOBILE']],
        tags: fetch_tags(row)
        # регион. организация. ФИО?
      }
    end

    def fetch_tags(row)
      row&.fetch_values('AGENT', 'LEAD_TYPE', 'HOME_PHONE', 'SUM_LOAN')
    end
  end
end