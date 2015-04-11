class Course < ActiveRecord::Base
  has_many :termlists
  has_many :terms, dependent: :destroy, through: :termlists
  validates_presence_of :coursename
  validates_presence_of :coursetitle
end
