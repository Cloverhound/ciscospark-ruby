require "httparty"

module Ciscospark
  class Spark
      def self.get_rooms(token)
        response = HTTParty.get("https://api.ciscospark.com/v1/rooms", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
        return response
      end

      def self.post_message(token, room_id, message)
        response = HTTParty.post("https://api.ciscospark.com/v1/messages", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "roomId" => room_id,
                 "text" => message}.to_json)
        return response
      end

      def self.post_team(token, name)
        response = HTTParty.post("https://api.ciscospark.com/v1/teams", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "name" => name}.to_json)
        return response
      end

      def self.post_team_membership(token, team_id, person_email)
        response = HTTParty.post("https://api.ciscospark.com/v1/team/memberships", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "teamId" => team_id,
                 "personEmail" => person_email}.to_json)
        return response
      end

      def self.post_message_file(token, room_id, message, file)
        response = HTTParty.post("https://api.ciscospark.com/v1/messages", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "roomId" => room_id,
                 "text" => message, "file" => file}.to_json)
        return response
      end

      def self.get_message(token, message_id)
        response = HTTParty.get("https://api.ciscospark.com/v1/messages/" + message_id, headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
        return response
      end

      def self.get_messages(token,room_id,max=10,beforeid=nil)
        if (beforeid.nil?)
          @options = { headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, query: {roomId: room_id, max: max} }
          response = HTTParty.get("https://api.ciscospark.com/v1/messages", @options)
        else
          @options = { headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, query: {roomId: room_id, max: max, beforeMessage: beforeid} }
          response = HTTParty.get("https://api.ciscospark.com/v1/messages", @options)
        end
        return response
      end

      def self.post_webhook(token, resource, event, resource_id, url, name)
        response = HTTParty.post("https://api.ciscospark.com/v1/webhooks", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "resource" => resource, "event" => event, "filter" => resource_id,
                 "targetUrl" => url, "name" => name, }.to_json)
        return response
      end

      def self.get_webhooks(token)
        response = HTTParty.get("https://api.ciscospark.com/v1/webhooks", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
        return response
      end

      def self.delete_webhook(token,id)
        response = HTTParty.delete("https://api.ciscospark.com/v1/webhooks/" + id.to_s, headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
        return response
      end

      def self.post_room(token, title,team_id=nil)
        if team_id.nil?
          response = HTTParty.post("https://api.ciscospark.com/v1/rooms", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "title" => title}.to_json)
        else
          response = HTTParty.post("https://api.ciscospark.com/v1/rooms", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "title" => title, "teamId" => team_id}.to_json)
        end
        return response
      end

      def self.delete_room(token,id)
        response = HTTParty.delete("https://api.ciscospark.com/v1/rooms/" + id.to_s, headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
        return response
      end

      def self.get_room(token, room_id)
        @options = { headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, query: {showSipAddress: true} }
        response = HTTParty.get("https://api.ciscospark.com/v1/rooms/" + room_id, @options)
        return response
      end

      def self.get_memberships(token,room_id)
        @options = { headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, query: {roomId: room_id} }
        response = HTTParty.get("https://api.ciscospark.com/v1/memberships", @options)
        return response
      end

      def self.post_membership(token, room_id, email, moderator=nil)
        response = HTTParty.post("https://api.ciscospark.com/v1/memberships", headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body => { "roomId" => room_id, "personEmail" => email}.to_json)
        return response
      end

      def self.delete_membership(token,id)
        response = HTTParty.delete("https://api.ciscospark.com/v1/memberships/" + id.to_s, headers: {"Authorization" => "Bearer " + token, 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
        return response
      end
    end
end
