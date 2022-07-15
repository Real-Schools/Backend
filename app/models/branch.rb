# frozen_string_literal: true

class Branch < ApplicationRecord
  has_many :students
end
