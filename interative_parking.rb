require_relative 'parking_management'
require_relative 'vehicle_management'
require_relative 'vehicle'

parking_manager    = ParkingManagement.new
vehicle_management = VehicleManagement.new

puts 'Available commands:'
puts 'create_parking_lot(slots, hourly_rate, grace_period)'
puts 'park(plate_number, vehicle_color, entry_time)'
puts "\n"

loop do
  input = gets.chomp
  command, *params = input.split /\s/

  case command
  when /\Acreate_parking_lot\z/i
    number_of_slots         = params[0].to_i
    hourly_rate             = params[1].to_f
    grace_period_in_minutes = params[2].to_f

    parking_manager.create_parking_lot(
      number_of_slots:         number_of_slots,
      hourly_rate:             hourly_rate,
      grace_period_in_minutes: grace_period_in_minutes)
      puts "\n"


end