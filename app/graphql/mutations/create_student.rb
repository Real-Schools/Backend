class Mutations::CreateStudent < Mutations::BaseMutation
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :other_names, String
  argument :bio, String
  argument :level, String, required: true
  argument :enrolled_at, GraphQL::Types::ISO8601DateTime, required: true
  argument :branch_id, Integer, required: true

  field :student, Types::StudentType, null: false
  field :errors, [String], null: false

  def resolve(first_name:, last_name:, bio:, other_names:, level:, enrolled_at:, branch_id:)
    student = Student.new(first_name: first_name, last_name: last_name,
                          other_names: other_names, level: level, student_number: generate_student_number(branch_id),
                          enrolled_at: enrolled_at, branch_id: branch_id, bio: bio)

    if student.save
      { student: student, errors: [] }
    else
      { student: nil, errors: student.errors.full_messages }
    end
  end

  def generate_password
    rand(36**8).to_s(36)
  end

  def generate_student_number(branch)
    prefix = Branch.find(branch).prefix
    loop do
      reference = rand(36**8).to_s(36)
      unless Student.where(student_number: "#{prefix}-#{reference.upcase}").exists?
        break "#{prefix}-#{reference.upcase}"
      end
    end
  end
end
