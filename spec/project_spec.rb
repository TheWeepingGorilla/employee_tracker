require 'spec_helper'


 describe "Project" do
  it "has many employees" do
    awesome_project = Project.create({:name => "Project Awesome", :id => 1})
    employee1 = Employee.create({:name => "Justin"})
    employee2 = Employee.create({:name => "Sean"})
    employee1.projects << awesome_project
    employee2.projects << awesome_project
    binding.pry
    expect(awesome_project.employees).to eq [employee1, employee2]
  end
end
