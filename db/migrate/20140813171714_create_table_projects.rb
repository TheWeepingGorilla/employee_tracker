class CreateTableProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
    end
  end
end
