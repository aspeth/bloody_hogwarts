require 'rails_helper'

RSpec.describe 'courses index page' do
  it 'shows the names of all courses and the number of students enrolled' do
    harry = Student.create!(name: "Harry Potter", age: 13, house: "Griffindor")
    draco = Student.create!(name: "Draco Malfoy", age: 14, house: "Slytherin")

    herbology = Course.create!(name: "Herbology")
    dada = Course.create!(name: "Defense Against the Dark Arts")
    death_eating = Course.create!(name: "Death Eating 101")

    student_course_1 = StudentCourse.create!(student_id: harry.id, course_id: herbology.id)
    student_course_2 = StudentCourse.create!(student_id: draco.id, course_id: herbology.id)
    student_course_3 = StudentCourse.create!(student_id: harry.id, course_id: dada.id)
    student_course_4 = StudentCourse.create!(student_id: draco.id, course_id: death_eating.id)

    visit "/courses"
    
    within "#courses-#{herbology.id}" do
      expect(page).to have_content("Herbology: 2")
    end
    
    within "#courses-#{dada.id}" do
      expect(page).to have_content("Defense Against the Dark Arts: 1")
    end
    
    within "#courses-#{death_eating.id}" do
      expect(page).to have_content("Death Eating 101: 1")
    end
  end
end

# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of students enrolled in each course.

# (e.g. "Defense Against the Dark Arts: 5"
#       "Herbology: 10")