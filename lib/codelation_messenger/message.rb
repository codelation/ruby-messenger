require 'rest-client'
module CodelationMessenger
  class Message
    def self.send_message(message, args = {})
      data = args["data"] || args[:data] || {}
      async = args["async"] || args[:async] || false
      puts "MESSAGE: #{message}"
      puts "CONFIG: #{CodelationMessenger::Configuration.url}"
      url = File.join(CodelationMessenger::Configuration.url, message)
      headers = {content_type: :json, accept: :json, Authorization: "Bearer #{CodelationMessenger::Configuration.api_token}"}
      if !async
        begin
          response = RestClient.post(url, data.to_json, headers)

          if response.code == 200
            return JSON.parse(response.body)
          else
            puts "Failed(CODE: #{response.code}) => #{response.body}"
            return false
          end
        rescue RestClient::ExceptionWithResponse => e
          puts "Failed(CODE: #{e.response.code}) => #{e.response.body}"
          return false
        end
      else
        Thread.new do
          RestClient.post(url, data.to_json, headers)
        end
        return true
      end
    end
  end
end
