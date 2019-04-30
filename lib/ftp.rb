require 'net/ftp'

module Ftp
  def self.call
    Net::FTP.open(
      ENV['FTP_HOST'],
      port: ENV['FTP_PORT']&.to_i,
      username: ENV['FTP_USER'],
      password: ENV['FTP_PASS']
    ) do |ftp|
      yield(ftp)

      ftp.close
    end
  end
end
