require 'spec_helper'

describe "Employee" do
  it "has many projects & uses join table to express a many to many relationship" do
    awesome_project = Project.create({:name => "Project Awesome", :id => 1})
    super_awesome_project = Project.create({:name => "Super Awesome", :id => 2})
    employee1 = Employee.create({:name => "Justin"})
    employee1.projects << awesome_project
    employee1.projects << super_awesome_project
    expect(employee1.projects).to eq [awesome_project, super_awesome_project]
  end
end
