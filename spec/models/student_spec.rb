require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'model methods' do
    it "#self.average_age" do
      harry = Student.create!(name: "Harry Potter", age: 13, house: "Griffindor")
      draco = Student.create!(name: "Draco Malfoy", age: 14, house: "Slytherin")
      ron = Student.create!(name: "Ron Weasley", age: 15, house: "Griffindor")

      expect(Student.average_age).to eq(14)
    end
  end

end
