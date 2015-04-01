class RemoveCourseIdFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :course_id, :integer
  end
end
