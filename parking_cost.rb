class ParkingCost
  attr_reader :hourly_rate, :duration, :grace_period_in_minutes

  def initialize(args={})
    @hourly_rate = args.fetch(:hourly_rate)
    @duration    = args.fetch(:duration)
    @grace_period_in_minutes = args.fetch(:grace_period_in_minutes)
  end
  def amount
    duration_less_grace_period * hourly_rate
  end

  def duration_less_grace_period
    duration - (grace_period_in_minutes / 60.0) #60 mins per hour
  end
end