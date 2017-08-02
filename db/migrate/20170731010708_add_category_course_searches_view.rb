class AddCategoryCourseSearchesView < ActiveRecord::Migration[5.1]

  def change
    ActiveRecord::Base.connection.execute <<-SQL

    CREATE OR REPLACE VIEW category_searches AS

      SELECT categories.id AS searchable_id,
      'Category' AS searchable_type,
      categories.title AS term
      FROM categories

      UNION

      SELECT categories.id AS searchable_id,
      'Category' AS searchable_type,
      courses.title as term
      FROM categories
      JOIN courses ON categories.id = courses.category_id

    SQL
  end
end
