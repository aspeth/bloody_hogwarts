class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  def student_count
    students.count
  end

  def alpha_students
    students.order(:name)
  end
end
