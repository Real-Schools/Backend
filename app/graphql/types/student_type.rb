# frozen_string_literal: true

module Types
  class StudentType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :encrypted_password, String
    field :reset_password_token, String
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :other_names, String
    field :level, String, null: false
    field :student_number, String, null: false
    field :branch_id, Integer, null: false
    field :enrolled_at, GraphQL::Types::ISO8601DateTime, null: false
    field :remember_created_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :bio, String
  end
end
