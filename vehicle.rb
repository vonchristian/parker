class Vehicle

  attr_accessor :plate_number, :parking_status, :color

  def initialize(args={})
    @plate_number   = args[:plate_number] || generate_plate_number
    @parking_status = args[:parking_status]
    @color          = args[:color]
  end

  def generate_plate_number
    strings = ("A".."Z").to_a.sample(3).join
    numbers = (1..9).to_a.sample(4).join

    strings + "-" + numbers
  end
end