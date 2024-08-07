class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :subject
      t.integer :marks
      t.boolean :is_deleted, default: false
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
