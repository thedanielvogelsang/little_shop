class AddsRetiredColumnToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :retired, :timestamp
  end
end
