class Parking
  attr_accessor :vehicle, :slot

  def initialize(args={})
    @vehicle = args.fetch(:vehicle)
    @slot    = args.fetch(:slot)
  end
end