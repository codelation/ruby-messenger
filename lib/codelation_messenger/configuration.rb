module CodelationMessenger
  class Configuration
    cattr_accessor :api_token, :host, :endpoint

    def self.url
      File.join(@@host, CodelationMessenger::Configuration.endpoint)
    end

    def self.endpoint
      @@endpoint || "message"
    end
  end
end
