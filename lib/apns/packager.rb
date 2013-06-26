module APNS
  class Packager

    attr_reader :notification

    def initialize(notification)
      @notification = notification
    end

    def method_missing(meth, *args, &block)
      if %w[device_token alert badge sound other].include?(meth.to_s)
        notification.send(meth, *args, &block)
      else
        super
      end
    end

    def package
      [0, 0, 32, token, 0, message.bytesize, message].pack('ccca*cca*')
    end

    private

    def token
      @token ||= [device_token.gsub(/[\s|<|>]/,'')].pack('H*')
    end

    def message
      @message ||= pack_message
    end

    def pack_message
      aps = {'aps'=> {} }
      aps['aps']['alert'] = alert if alert
      aps['aps']['badge'] = badge if badge
      aps['aps']['sound'] = sound if sound
      aps.merge!(notification.other) if other
      aps.to_json
    end

  end
end
