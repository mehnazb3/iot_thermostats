# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Initialize settings
puts "Initializing Settings"

# Create ThermoStats
puts "Initializing Thermostats"
["Germany", "India", "United States", "Japan", "China"].each do |address|
  thermostat = ThermoStat.new(location: address)
  thermostat.household_token = thermostat.generate_household_token
  puts "#{thermostat.id} with token #{thermostat.household_token} Created" if thermostat.save
end