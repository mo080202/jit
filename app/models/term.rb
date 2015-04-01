class Term < ActiveRecord::Base
  has_many :termlists
  has_many :courses, through: :termlists
end
