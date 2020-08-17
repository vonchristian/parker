class Parking
  attr_accessor :vehicle, :slot

  def initialize(args={})
    @vehicle = args.fetch(:vehicle)
    @slot    = args.fetch(:slot)
  end

  def park!
    slot.availability_status = false
    vehicle.parking_status = true
  end

  def unpark!
    vehicle.parking_status = false
    slot.availability_status = true
  end
end