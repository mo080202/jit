class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :termname
      t.string :definition
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
