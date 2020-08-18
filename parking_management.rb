require_relative 'parking_lot'

class ParkingManagement
  attr_accessor :parking_lots, :vehicles

  def initialize(args={})
    @parking_lots = []
    @vehicles     = []
  end

  def create_parking_lot(number_of_slots, hourly_rate, grace_period_in_minutes)
    parking_lot       = ParkingLot.new(hourly_rate: hourly_rate, grace_period_in_minutes: grace_period_in_minutes)
    parking_lots << parking_lot

    parking_lot.create_slots(number_of_slots)

    puts "Created a parking lot with #{number_of_slots} slots, with rate of P#{hourly_rate}/hour and grace period of #{grace_period_in_minutes} minutes."
  end

  def park(plate_number)
    vehicle = vehicles.select{ |v| v.plate_number == plate_number }.first

    return puts "Vehicle not found" if vehicle.nil?
    return puts "Vehicle already parked" if vehicle.parked?

    parking_lot = parking_lots.first
    if parking_lot.available_slots.count > 0
      parking_lot.park(vehicle)
      parking     = parking_lot.parkings.select { |vh| vh.vehicle == vehicle }.first
      slot_number = parking_lot.slots.find_index(parking.slot) + 1 #add 1 since array index starts at 0

      puts "Allocated slot number: #{slot_number} to #{plate_number}."
    elsif parking_lot.vehicles.include?(vehicle)
      puts "Vehicle is already parked!"
    else
      puts "Sorry, parking lot is full"
    end
  end

  def leave(slot_number)
    parking_lot = parking_lots.first
    slot        = parking_lot.slots[slot_number -1] #less 1 since array index starts at 0
    parking     = parking_lot.parkings.select{ |parking| parking.slot == slot }.first

    parking_lot.unpark(parking.vehicle)

    print "Slot #{slot_number} is now free"
  end
end