class ParkingCost
  attr_reader :hourly_rate, :duration

  def initialize(args={})
    @hourly_rate = args.fetch(:hourly_rate)
    @duration    = args.fetch(:duration)
  end
  def amount
    duration * hourly_rate
  end
end