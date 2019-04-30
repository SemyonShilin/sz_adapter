module Service
  class Put < BaseService
    def call
      Ftp.call do |ftp|
        ftp.chdir('put/lang/ruby/contrib')
        ftp.putbinaryfile('nif.rb-0.91.gz', 'nif.gz', 1024)
      end
    end

    private

    attr_accessor :file

    def initialize(file:)
      @file = file
    end
  end
end
