require_relative 'parking_management'
require_relative 'vehicle_management'
require_relative 'vehicle'

    parking_manager = ParkingManagement.new
    parking_manager.create_parking_lot(6, 10, 0)
    parking_lot = parking_manager.parking_lots.first

    vehicle_management = VehicleManagement.new
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-1234', color: 'White')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-5032', color: 'White')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-3458', color: 'White')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-0001', color: 'Blue')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-9999', color: 'Black')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-1233', color: 'Blue')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-4545', color: 'Gray')
    vehicle_management.vehicles << Vehicle.new(plate_number: 'ABC-4546', color: 'Gray')

    parking_manager.vehicles << vehicle_management.vehicles
    parking_manager.vehicles.flatten!

    parking_manager.park('ABC-1234')
    parking_manager.park('ABC-5032')
    parking_manager.park('ABC-3458')
    parking_manager.park('ABC-0001')
    parking_manager.park('ABC-9999')
    parking_manager.park('ABC-1233')

    parking_manager.leave(4)

    puts "\n"
    puts "\n"

    parking_lot.status
    puts "\n"
    parking_manager.park('ABC-4545')
    parking_manager.park('ABC-4546')
    puts "\n"

    vehicle_management.plate_number_for_vehicles_with_color('White')

    parking_lot.slot_numbers_for_vehicles_with_color('White')
    puts "\n"
    parking_lot.slot_numbers_for_plate_number('ABC-1234')
    puts "\n"
    parking_lot.slot_numbers_for_plate_number('ABC-9999')
    puts "\n"
    parking_lot.slot_numbers_for_plate_number('ABC-NOT-FOUND')

