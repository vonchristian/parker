class VehicleManagement
  attr_accessor :vehicles

  def initialize(args={})
    @vehicles = []
  end

  def plate_number_for_vehicles_with_color(color)
    plate_numbers = []

    vehicles.select{ |v| v.color == color }.each { |vehicle| plate_numbers << vehicle.plate_number }
    puts plate_numbers.join(',')
  end
end