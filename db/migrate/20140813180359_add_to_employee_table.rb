class AddToEmployeeTable < ActiveRecord::Migration
  def change
    remove_column :employees, :div_id, :int
    add_column :employees, :division_id, :int
    add_column :employees, :project_id, :int
  end
end
