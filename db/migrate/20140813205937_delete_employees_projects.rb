class DeleteEmployeesProjects < ActiveRecord::Migration
  def change
    drop_table(:employees_projects)
  end
end
