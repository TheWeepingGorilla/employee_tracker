class ChangeNameOfEmployeesTable < ActiveRecord::Migration
  def change
    rename_table('employees_tables', 'employees')
  end
end
