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
end