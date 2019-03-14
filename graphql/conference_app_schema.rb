require 'graphql'
require_relative 'query_type'

class ConferenceAppSchema < GraphQL::Schema
  query QueryType

  
end
