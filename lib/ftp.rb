require 'net/ftp'

module Ftp
  def self.call
    Net::FTP.open(
      ENV['FTP_HOST'],
      port: ENV['FTP_PORT']&.to_i,
      username: ENV['FTP_USER'],
      password: ENV['FTP_PASS']
    ) do |ftp|
      # ftp.chdir('pub/lang/ruby/contrib')
      file = ftp.ls
      # ftp.getbinaryfile('nif.rb-0.91.gz', 'nif.gz', 1024)


      ftp.close
    end
  end
end
