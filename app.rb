require 'sinatra'
require 'sinatra/activerecord'
require 'rack/contrib'
require './graphql/conference_app_schema'

class ConferenceApp < Sinatra::Base
  set :database_file, 'config/database.yml'
  use Rack::PostBodyContentTypeParser

  post '/graphql' do
    result = ConferenceAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: { current_user: nil },
    )
    JSON.generate(result)
  end

  #example query
  #{
	#   "query": "{speaker(authkey: a123) { list { id sounds { name } } }}"
  #}
end
