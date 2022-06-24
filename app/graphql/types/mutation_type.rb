module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_branch, mutation: Mutations::CreateBranch
    field :create_student, mutation: Mutations::CreateStudent
  end
end
