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

  when /\Apark\z/i
    plate_number = params[0]
    color        = params[1]
    entry_time   = params[2]

    vehicle = Vehicle.new(plate_number: plate_number, color: color)
    vehicle_management.vehicles << vehicle
    parking_manager.vehicles    << vehicle
    parking_manager.vehicles.flatten!
    vehicle_management.vehicles.flatten!
    parking_manager.park(vehicle.plate_number, entry_time)
    puts "\n"

  when /\Aleave\z/i
    plate_number   = params[0]
    departure_time = params[1]
    parking_manager.leave(plate_number, departure_time)
    puts "\n"

  when /\Astatus\z/i
    parking_manager.parking_lots.first.status
    puts "\n"

  when /\Aplate_number_for_vehicles_with_color\z/i
    color = params[0]
    vehicle_management.plate_number_for_vehicles_with_color(color)
    puts "\n"

  when /\Aslot_numbers_for_vehicles_with_color\z/i
    color = params[0]
    print 'Slot Numbers: '
    parking_manager.parking_lots.first.slot_numbers_for_vehicles_with_color(color)
    puts "\n"

end