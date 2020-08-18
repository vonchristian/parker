require_relative 'slot'
require_relative 'parking'
require_relative 'ticket'

class ParkingLot
  attr_accessor :slots, :parkings, :vehicles, :issued_tickets, :hourly_rate, :grace_period_in_minutes

  def initialize(args={})
    @slots          = []
    @parkings       = []
    @vehicles       = []
    @issued_tickets = []
    @hourly_rate    = args.fetch(:hourly_rate)
    @grace_period_in_minutes = args[:grace_period_in_minutes] || 0
  end

  def create_slots(number_of_slots)
    number_of_slots.times do
      slots << Slot.new
    end
  end

  def available_slots
    slots.select{ |slot| slot.available? }
  end

  def status
    puts "Slot No. | \tPlate Number | \tColour"
    parkings.each do |parking|
      slot_number = slots.find_index(parking.slot) + 1 #add 1 since array index starts at 0
      puts "#{slot_number} | \t#{parking.vehicle.plate_number} | \t#{parking.vehicle.color}"
    end
    return
  end

  def park(vehicle)
    slot    = available_slots.first
    parking = Parking.new(vehicle: vehicle, slot: slot)
    ticket  = Ticket.new(parking: parking)
    parkings << parking
    vehicles << vehicle
    issued_tickets << ticket
    parking.park!
  end

  def unpark(vehicle)
    parking = parkings.select{ |vh| vh.vehicle == vehicle }.first
    parking.unpark!

    vehicles.delete_at(vehicles.index(vehicle))
    parkings.delete_at(parkings.index(parking))
  end

  def slot_numbers_for_vehicles_with_color(color)
    slot_numbers = []

    parkings.select{ |p| p.vehicle.color == color }.each do |parking|
      slot_number = slots.find_index(parking.slot) + 1
      slot_numbers << slot_number
    end
    puts slot_numbers.join(',')
  end

  def slot_numbers_for_plate_number(plate_number)
    slot_numbers = []

    selected_parkings = parkings.select{ |p| p.vehicle.plate_number == plate_number }
    if selected_parkings.count > 0
      selected_parkings.each do |parking|
        slot_number = slots.find_index(parking.slot) + 1
        slot_numbers << slot_number
      end
      puts slot_numbers.join(',')
    else
      puts 'Not found'
    end
  end
end