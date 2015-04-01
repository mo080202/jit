class AddCoursetitleToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :coursetitle, :string
  end
end
