class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.column :employee_id, :int
      t.column :project_id, :int
      t.column :description, :string
    end
  end
end
