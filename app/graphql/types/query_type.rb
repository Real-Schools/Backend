module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # Get all users
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    # Get a specific user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    # Get all branches
    field :branches, [Types::BranchType], null: false
    def branches
      Branch.all
    end

    # Get a specific branch
    field :branch, Types::BranchType, null: false do
      argument :id, ID, required: true
    end
    def branch(id:)
      Branch.find(id)
    end

    # Get all students
    field :students, [Types::StudentType], null: false
    def students
      Student.all
    end

    # Get a specific student
    field :student, Types::StudentType, null: false do
      argument :id, ID, required: true
    end
    def student(id:)
      Student.find(id)
    end
  end
end
