require 'graphql'
require_relative 'base_object'
require './models/sound'

class Types::Sound < Types::BaseObject
  description 'Resembles a Speaker Object Type'

  field :id, ID, null: false
  field :name, String, null: false
end
