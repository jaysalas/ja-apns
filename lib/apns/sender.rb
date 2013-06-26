module APNS
  class Sender

    attr_reader :host, :port, :pem, :pass

    def initialize(params = {})
      @host = params[:host] || 'gateway.sandbox.push.apple.com'
      @port = params[:port] || 2195
      @pem = params[:pem] || raise("Path to your pem file required!")
      @pass = params[:pass]
    end

    def send_notifications(notifications)
      packages = notifications.select(&:valid?).map { |n| Packager.new(n).package }
      return if packages.none?
      connection do |ssl|
        packages.each { |package| ssl.write(package) }
      end
      true
    end

    private

    def connection
      raise "pem file does not exist!" unless File.exist?(self.pem)

      context      = OpenSSL::SSL::SSLContext.new
      context.cert = OpenSSL::X509::Certificate.new(File.read(self.pem))
      context.key  = OpenSSL::PKey::RSA.new(File.read(self.pem), self.pass)

      sock         = TCPSocket.new(self.host, self.port)
      ssl          = OpenSSL::SSL::SSLSocket.new(sock, context)
      ssl.connect

      yield(ssl)

      ssl.close
      sock.close

      true
    end

  end
end
