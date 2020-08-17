require_relative 'slot'
require_relative 'parking'

class ParkingLot
  attr_accessor :slots, :parkings, :vehicles

  def initialize(args={})
    @slots    = []
    @parkings = []
    @vehicles = []
  end
end