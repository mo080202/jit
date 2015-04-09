class Course < ActiveRecord::Base
  has_many :termlists
  has_many :terms, dependent: :destroy, through: :termlists
end
