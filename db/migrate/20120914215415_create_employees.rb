class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.references :company

      t.timestamps
    end
    add_index :employees, :company_id
  end
end
