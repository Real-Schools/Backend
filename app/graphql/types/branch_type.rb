# frozen_string_literal: true

module Types
  class BranchType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :prefix, String
    field :location, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
