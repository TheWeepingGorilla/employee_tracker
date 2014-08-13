require 'spec_helper'

describe "Project" do
  it "has many employees tied to it through contributions" do
    employee = Employee.create({:name => "slacker"})
    project = Project.create({:name => "employee tracker"})
    contributions = [ Contribution.create({:description => "did stuff"}),
                      Contribution.create({:description => "didn't do stuff"})]

    contributions.each do |contribution|
      project.contributions << contribution
      employee.contributions << contribution
    end
    expect(project.employees.first).to eq employee
  end
end

