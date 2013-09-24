module Malcom
  module Connector
    extend self

    def push(platform, message, custom_field, udids)
      raise "Must pass an array of UDIDs" unless udids && udids.kind_of?(Array)
      raise "Must pass a dictionary of key and value for the custom field" unless custom_field && custom_field.kind_of?(Hash)
      raise "Must pass a non-blank message" unless message && message.length > 0
      raise "Must pass a non-blank platform" unless platform && platform.length > 0
      notification = {
        "notification" => {
          "environment" => Malcom.settings["environment"],
          "message" => message,
          "notificationCustomization" => {
            "sound" => "default",
            "badge" => 1,
            "customFields" => {
              "entry" => [{"key" => custom_field["key"], "value" => custom_field["value"]}]
            }
          },
          "udids" => udids,
          "applicationCode" => Malcom.settings["platform_udid"][platform]
        }
      }
      do_get(notification.to_json)
    end

    private

    def do_get(notification)
      uri = URI.parse(Malcom.settings["uri"])
      
      rq = Net::HTTP::Post.new(uri.request_uri)
      rq.basic_auth Malcom.settings["user"], Malcom.settings["password"]
      rq.body = notification
      rq["Content-Type"] = "application/json"

      rs = Net::HTTP.new(uri.host, uri.port).start do |http|
        http.read_timeout = 10
        http.request(rq)
      end
    end
  end
end
