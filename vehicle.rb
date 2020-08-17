class Vehicle
  VEHICLE_COLORS =  ["White", "Black", "Gray", "Blue", "Green", "Red", "Yellow", "Orange"]

  attr_accessor :plate_number, :parking_status, :color

  def initialize(args={})
    @plate_number   = args[:plate_number] || generate_plate_number
    @parking_status = args[:parking_status]
    @color          = args[:color] || generate_color
  end

  def generate_plate_number
    strings = ("A".."Z").to_a.sample(3).join
    numbers = (1..9).to_a.sample(4).join

    strings + "-" + numbers
  end

  def generate_color
    Vehicle::VEHICLE_COLORS.sample
  end

  def status
    if parked?
      "Parked"
    else
      "Unparked"
    end
  end
  def parked?
    parking_status == true
  end
end