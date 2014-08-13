require 'spec_helper'

describe 'Division' do
  it "has many employees" do
    test_division = Division.create({:name => "Purchasing"})
    test_employee1 = Employee.create({:name => "Bob"})
    test_employee2 = Employee.create({:name => "Bobby Jr"})
    test_division.employees << test_employee1
    test_division.employees << test_employee2
    expect(test_division.employees).to eq [test_employee1, test_employee2]
  end

  it "can list all projects for all employees in a division" do
    employee1 = Employee.create({:name => "slacker"})
    project1 = Project.create({:name => "employee tracker"})
    division1 = Division.create({:name => "whatever"})
    contributions = [ Contribution.create({:description => "did stuff"}),
                      Contribution.create({:description => "didn't do stuff"})]

    contributions.each do |contribution|
      project1.contributions << contribution
      employee1.contributions << contribution
    end
    division1.employees << employee1

    expect(project1.employees.first).to eq employee1
    expect(division1.employees[0].projects[0]).to eq project1
  end
end


