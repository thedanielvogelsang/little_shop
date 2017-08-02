class AddCategoryCoursesSearchIndices < ActiveRecord::Migration[5.1]
  def change
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE INDEX index_categories_on_title ON categories USING gin(to_tsvector('english', title));
      CREATE INDEX index_courses_on_title ON courses USING gin(to_tsvector('english', title));
    SQL
  end
end
