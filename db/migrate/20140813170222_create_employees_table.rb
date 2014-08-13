class CreateEmployeesTable < ActiveRecord::Migration
  def change
    create_table :employees_tables do |t|
      t.column :name, :string
      t.column :div_id, :int
    end
  end
end
