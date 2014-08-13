require 'active_record'
require 'pry'
require './lib/contribution'
require './lib/division'
require './lib/employee'
require './lib/project'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def prompt(msg = "=> ")
  print msg
  gets.chomp
end

def prompt?(msg = "?=> ")
  prompt(msg).downcase == 'y'
end

def add_employee
  Employee.create({:name => prompt("Enter employee's name: ")})
end

def list_employees
  Employee.all.each {|emp| puts emp['name']}
  prompt("Select employee by name: ")
end

def list_divisions
  Division.all.each {|div| puts div['name']}
  prompt("Select division by name or enter: ")
end

def create_division
  Division.create({:name => prompt("Enter the name of this division: ")})
end

def add_employee_to_division
  employee_to_add = Employee.where({:name => list_employees})
  division_to_add_to = Division.where({:name => list_divisions})
  division_to_add_to.first.employees << employee_to_add.first
end

def print_header(title)
  title = title + " " if title.length % 2 > 0
  puts '*' * 80
  puts "*" + title + (" " * (80 - title.length-2)) + "*"
  puts '*' * 80
end

def list_employees_by_division
  division_to_list = Division.where({:name =>list_divisions})
  division_to_list.first.employees.each do |employee|
    puts "#{employee['name']}"
  end
  puts "\n"
  prompt("Press enter to continue")
end

def menu
  system("clear")
  print_header(" EMPLOYEE TRACKER")
  puts "A: Add Employee | L: List Employee"
  puts "D: Create Division | AD: Add Employee to Division | LD: List Divisions"
  puts "LED: List Employees by Division | "
  puts "X: Exit"

  case prompt("Enter command => ").downcase
  when 'x'
    return false
  when 'a'
    add_employee
  when 'l'
    list_employees
  when 'd'
    create_division
  when 'ad'
    add_employee_to_division
  when 'ld'
    list_divisions
  when 'led'
    list_employees_by_division
  end
  true
end

while menu
end
