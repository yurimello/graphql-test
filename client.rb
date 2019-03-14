require './config/swapi'
auth = '123'

SpeakerQuery = SWAPI::Client.parse <<-'GRAPHQL'
  query($auth: String!) {
    speaker(authkey: $auth) {
      list {
        id name sounds {
          name
        }
      }
    }
  }
GRAPHQL

result = SWAPI::Client.query(SpeakerQuery, variables: {auth: auth})

# result.data.speaker.list.first.sounds.first

result.data.speaker.list.each do |speaker|
  puts "#{speaker.id} #{speaker.name}"
  speaker.sounds.each do |sound|
    puts "!!! #{sound.name}"
  end
end
