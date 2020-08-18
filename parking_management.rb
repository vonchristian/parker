require_relative 'parking_lot'
require_relative 'parking_cost'
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

  def park(plate_number, entry_time)
    vehicle = vehicles.select{ |v| v.plate_number == plate_number }.first

    return puts "Vehicle not found" if vehicle.nil?
    return puts "Vehicle already parked" if vehicle.parked?

    parking_lot = parking_lots.first
    if parking_lot.available_slots.count > 0
      parking_lot.park(vehicle, entry_time)
      parking     = parking_lot.parkings.select { |vh| vh.vehicle == vehicle }.first
      slot_number = parking_lot.slots.find_index(parking.slot) + 1 #add 1 since array index starts at 0

      puts "Allocated slot number: #{slot_number} to #{plate_number}. Entry time #{entry_time}."
    elsif parking_lot.vehicles.include?(vehicle)
      puts "Vehicle is already parked!"
    else
      puts "Sorry, parking lot is full"
    end
  end

  def leave(plate_number, departure_time)
    vehicle     = vehicles.select{ |v| v.plate_number == plate_number }.first
    parking_lot = parking_lots.first
    parking     = parking_lot.parkings.select { |vh| vh.vehicle == vehicle }.first
    slot_number = parking_lot.slots.find_index(parking.slot) +1

    parking_lot.unpark(parking.vehicle, departure_time)

    amount = ParkingCost.new(
      duration:                parking.duration_in_hours,
      hourly_rate:             parking_lot.hourly_rate,
      grace_period_in_minutes: parking_lot.grace_period_in_minutes).amount

    ticket = parking_lot.issued_tickets.select{|ticket| ticket.parking == parking }.first
    ticket.price = amount
    puts "Vehicle with plate number #{plate_number} is now leaving. Departure time: #{departure_time}."
    puts "Duration: #{parking.duration_in_hours} hour/s: Paid: P#{amount.round(2)}"
    puts"Slot #{slot_number} is now free"
  end
end