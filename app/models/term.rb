class Term < ActiveRecord::Base
  has_many :termlists
  has_many :courses, through: :termlists

  def all_courses=(names)
    self.courses = names.split(",").map do |name|
      Course.where(coursename: name.strip).first_or_create!
    end
  end

  def all_courses
    self.courses.map(&:coursename).join(", ")
  end

end
