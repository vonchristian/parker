require_relative 'parking_lot'
require_relative 'vehicle'

class ParkingManagement
  attr_accessor :parking_lots, :vehicles

  def initialize(args={})
    @parking_lots = []
    @vehicles     = []
  end
end