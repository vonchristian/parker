class Ticket
  attr_accessor :parking, :price

  def initialize(args={})
    @parking = args.fetch(:parking)
    @price   = 100
  end
end