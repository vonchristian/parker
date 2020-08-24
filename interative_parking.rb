require_relative 'parking_management'
require_relative 'vehicle_management'
require_relative 'vehicle'

parking_manager    = ParkingManagement.new
vehicle_management = VehicleManagement.new

puts 'Available commands:'
puts 'create_parking_lot(slots, hourly_rate, grace_period)'
puts 'park(plate_number, vehicle_color, entry_time)'
puts "\n"

