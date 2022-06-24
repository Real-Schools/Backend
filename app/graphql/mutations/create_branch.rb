class Mutations::CreateBranch < Mutations::BaseMutation
  argument :name, String, required: true
  argument :prefix, String, required: true
  argument :location, String, required: true

  field :branch, Types::BranchType, null: false
  field :errors, [String], null: false

  def resolve(name:, prefix:, location:)
    branch = Branch.new(name: name, prefix: prefix, location: location)

    if branch.save
      { branch: branch, errors: [] }
    else
      { branch: nil, errors: branch.errors.full_messages }
    end
  end
end