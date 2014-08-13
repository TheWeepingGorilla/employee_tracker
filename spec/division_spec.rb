require 'spec_helper'

describe 'Division' do
  it "has many employees" do
    test_division = Division.create({:name => "Purchasing"})
    test_employee1 = Employee.create({:name => "Bob", :division_id => 1})
    test_employee2 = Employee.create({:name => "Bobby Jr", :division_id => 1})
    expect(test_division.employees).to eq Employee.all
  end
end
