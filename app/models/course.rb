class Course < ActiveRecord::Base
  has_many :termlists
  has_many :terms, dependent: :destroy, through: :termlists
  validates_presence_of :coursename, :coursetitle, :on => :create
end
