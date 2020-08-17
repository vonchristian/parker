require_relative 'parking_lot'

class ParkingManagement
  attr_accessor :parking_lots, :vehicles

  def initialize(args={})
    @parking_lots = []
    @vehicles     = []
  end

  def create_parking_lot(number_of_slots)
    parking_lot       = ParkingLot.new
    parking_lots << parking_lot

    parking_lot.create_slots(number_of_slots)

    puts "Created a parking lot with #{number_of_slots} slots"
  end

  def park(plate_number)
    vehicle = vehicles.select{ |v| v.plate_number == plate_number }.first

    if parking_lot.available_slots.count > 0
      parking_lot.park(vehicle)
      parking     = parking_lot.parkings.select { |vh| vh.vehicle == vehicle }.first
      slot_number = parking_lot.slots.find_index(parking.slot) + 1 #add 1 since array index starts at 0

      puts "Allocated slot number: #{slot_number} to #{plate_number}."
    else
      puts "Sorry, parking lot is full"
    end
  end
end