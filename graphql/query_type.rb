require 'graphql'
require_relative 'types/speaker'

class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  field :speaker, Types::Speaker, null: false do
    description 'Get all speakers of the system'
    argument :authkey, String, required: true
  end

  def speaker(authkey:)
    raise 'Unauthorized' unless authenticated?(authkey)
    Types::Speaker
  end

  private
  def authenticated?(authkey)
    authkey == '123'
  end

end
