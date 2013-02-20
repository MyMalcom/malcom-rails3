module Malcom
  module Connector
    def push(message, custom_field, udids)
      raise "Must be an array of UDIDs" unless udids && udids.kind_of?(Array)
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
          "applicationCode" => Malcom.settings["uuid"]
        }
      }
      do_get(notification.to_json)
    end

    private

    def do_get(notification)
      uri = URI.parse(Malcom.settings["uri"])
      
      rq = Net::HTTP::Get.new(uri.request_uri)
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
