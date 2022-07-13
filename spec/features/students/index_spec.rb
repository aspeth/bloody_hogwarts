require 'rails_helper'

RSpec.describe 'students index page' do
  it 'has the name/age/house of each student' do
    harry = Student.create!(name: "Harry Potter", age: 13, house: "Griffindor")
    draco = Student.create!(name: "Draco Malfoy", age: 14, house: "Slytherin")
    ron = Student.create!(name: "Ron Weasley", age: 15, house: "Griffindor")

    visit "/students"

    within "#students-#{harry.id}" do
      expect(page).to have_content("Name: Harry Potter")
      expect(page).to have_content("Age: 13")
      expect(page).to have_content("House: Griffindor")
    end

    within "#students-#{draco.id}" do
      expect(page).to have_content("Name: Draco Malfoy")
      expect(page).to have_content("Age: 14")
      expect(page).to have_content("House: Slytherin")
    end

    within "#students-#{ron.id}" do
      expect(page).to have_content("Name: Ron Weasley")
      expect(page).to have_content("Age: 15")
      expect(page).to have_content("House: Griffindor")
    end
  end
end

# User Story 1 of 4

# As a visitor,
# When I visit '/students',
# I see a list of students with the following information:
# -Name
# -Age
# -House
# (e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")