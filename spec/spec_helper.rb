require 'active_record'
require 'pry'
require 'rspec'

require 'employee'
require 'division'
require 'project'
require 'contribution'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(development_configuration)


RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Division.all.each { |division| division.destroy }
    Project.all.each { |project| project.destroy }
    Contribution.all.each { |contribution| contribution.destroy }
  end
end
