class Student < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house
  
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    average(:age)
  end

  def self.alpha_order
    order(:name)
  end
end
