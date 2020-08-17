class Parking
  attr_accessor :vehicle, :slot

  def initialize(args={})
    @vehicle = args.fetch(:vehicle)
    @slot    = args.fetch(:slot)
  end

  def create_slots(number_of_slots)
    number_of_slots.times do
      slots << Slot.new
    end
  end
end