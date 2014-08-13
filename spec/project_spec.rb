require 'spec_helper'

describe "Project" do
  it "has many employees tied to it through contributions" do
    employee1 = Employee.create({:name => "slacker"})
    project1 = Project.create({:name => "employee tracker"})
    division1 = Division.create({:name => "whatever"})
    contributions = [ Contribution.create({:description => "did stuff"}),
                      Contribution.create({:description => "didn't do stuff"})]

    contributions.each do |contribution|
      project1.contributions << contribution
      employee1.contributions << contribution
    end
    expect(project1.employees.first).to eq employee1
  end
end

