class Vehicle

  attr_accessor :plate_number, :parking_status, :color

  def initialize(args={})
    @plate_number   = args[:plate_number]
    @parking_status = args[:parking_status]
    @color          = args[:color]
  end
end