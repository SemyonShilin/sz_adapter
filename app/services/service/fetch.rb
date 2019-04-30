module Service
  class Fetch < BaseService
    def call
      ::Ftp.call do |ftp|
        ftp.chdir('pub/lang/ruby/contrib')
        file = ftp.list('n*')
        ftp.getbinaryfile('nif.rb-0.91.gz', 'nif.gz', 1024)

        Parse.call(file: file)
      end
    end

    private

    def initialize(_); end
  end
end
