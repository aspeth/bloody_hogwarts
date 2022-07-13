require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe "model methods" do
    it "#student_count" do
      harry = Student.create!(name: "Harry Potter", age: 13, house: "Griffindor")
      draco = Student.create!(name: "Draco Malfoy", age: 14, house: "Slytherin")
      ron = Student.create!(name: "Ron Weasley", age: 15, house: "Griffindor")

      course = Course.create!(name: "Alex's Class")

      student_course_1 = StudentCourse.create!(student_id: harry.id, course_id: course.id)
      student_course_2 = StudentCourse.create!(student_id: draco.id, course_id: course.id)
      
      expect(course.student_count).to eq(2)
    end
    
    it "#alpha_student" do
      harry = Student.create!(name: "Harry Potter", age: 13, house: "Griffindor")
      draco = Student.create!(name: "Draco Malfoy", age: 14, house: "Slytherin")
      ron = Student.create!(name: "Ron Weasley", age: 15, house: "Griffindor")
  
      course = Course.create!(name: "Alex's Class")
  
      student_course_1 = StudentCourse.create!(student_id: harry.id, course_id: course.id)
      student_course_2 = StudentCourse.create!(student_id: draco.id, course_id: course.id)
      student_course_2 = StudentCourse.create!(student_id: ron.id, course_id: course.id)
      
      expect(course.alpha_students).to eq([draco, harry, ron])
    end
  end

end
