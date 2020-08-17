require_relative 'slot'
require_relative 'parking'

class ParkingLot
  attr_accessor :slots, :parkings, :vehicles

  def initialize(args={})
    @slots    = []
    @parkings = []
    @vehicles = []
  end

  def create_slots(number_of_slots)
    number_of_slots.times do
      slots << Slot.new
    end
  end

  def available_slots
    slots.select{ |slot| slot.available? }
  end

  def park(vehicle)
    slot    = available_slots.first
    parking = Parking.new(vehicle: vehicle, slot: slot)
    parkings << parking
    vehicles << vehicle
    parking.park!
  end
end