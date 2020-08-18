require 'time'
class Parking
  attr_accessor :vehicle, :slot, :entry_time, :departure_time

  def initialize(args={})
    @vehicle        = args.fetch(:vehicle)
    @slot           = args.fetch(:slot)
    @entry_time     = args[:entry_time] || generate_entry_time
    @departure_time = args[:departure_time] || generate_departure_time
  end

  def park!
    slot.availability_status = false
    vehicle.parking_status = true
  end

  def unpark!(departure_time)
    vehicle.parking_status = false
    slot.availability_status = true
    departure_time = departure_time
  end

  def generate_entry_time
    Time.now
  end

  def generate_departure_time
    Time.now
  end

  def duration_in_hours
    entry     = Time.parse(entry_time.to_s)
    departure = Time.parse(departure_time.to_s)

    ((departure - entry) / 3600).round(2)
  end
end