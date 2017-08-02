class CreateCourseOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :course_orders do |t|
      t.references :order, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end
end
