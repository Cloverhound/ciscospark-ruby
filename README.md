# Cisco Spark for Ruby

Enjoy a ruby gem for the Cisco Spark API.

All REST API's you see on developers.ciscospark.com is currently available.

There is a pattern, I will show it for the rooms API..  This is the same for Teams, Memberships, Webhooks, Messages and People.

List Rooms -> Spark.get_rooms(access_token)
List Room -> Spark.get_rooms(access_token,room_id)
Create Room -> post_room(access_token,room_name,team_id=optional)
Update Room -> update_room(access_token,room_name,team_id=optional)
Delete Room -> Spark.delete_room(access_token,room_id)


## Using an API Call.

- add it to your GemFile!

`gem 'ciscospark-ruby'`

- Call it with your access_token

`Spark.get_teams(access_token) => {"items"=>
  [{"id"=>"Y2lzY29zcGFyazovL3VzL1RFQU0vNWQ5ZDkyZTAtODA0Ny0xMWU2LTg0ZGMtMGQ3MGJjNGNlYWFi",
    "name"=>"2016 Cisco Americas Customer Care Sales Summit",
    "creatorId"=>"Y2lzY29zcGFyazovL3VzL1BFT1BMRS9iMTRhYjM5NS02YjJkLTRhOTEtYjI5OC0zNGU2YmNlMzYwOGI",
    "created"=>"2016-09-21T22:04:28.302Z"},
   {"id"=>"Y2lzY29zcGFyazovL3VzL1RFQU0vZThmNzMzYzAtMmU4ZC0xMWU2LTg0YWEtNWY1MGViMDZhMjAx",
    "name"=>"Cloverhound",
    "creatorId"=>"Y2lzY29zcGFyazovL3VzL1BFT1BMRS84ZjllMzU1NC02OGJjLTQ5ZjQtOTk2MS1jMmIyZDY5YzE4NzI",
    "created"=>"2016-06-09T22:02:51.516Z"}]}`

Enjoy!


That's pretty much it!
