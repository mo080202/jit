class Course < ActiveRecord::Base
  has_many :termlists
  has_many :terms, through: :termlists
end
