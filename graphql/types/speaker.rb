require 'graphql'
require_relative 'base_object'
require_relative 'sound'
require './models/speaker'

class Types::Speaker < Types::BaseObject
  description 'Resembles a Speaker Object Type'

  field :id, ID, null: false
  field :name, String, null: false
  field :twitter_handle, String, null: true
  field :bio, String, null: true
  field :talk_title, String, null: true
  field :sounds, [Types::Sound], null: true

  field :list, [Types::Speaker], null: false do
    description 'Get all speakers of the system'
  end

  field :find, Types::Speaker, null: false do
    description 'Get all speakers of the system'
    argument :id, ID, required: true
  end

  field :byName, Types::Speaker, null: false do
    description 'Get all speakers of the system'
    argument :name, String, required: true
  end

  def list
    Speaker.all
  end

  def find(id:)
    Speaker.find(id)
  end

  def by_name(name:)
    Speaker.find_by(name: name)
  end


end
