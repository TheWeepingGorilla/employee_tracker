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
end
