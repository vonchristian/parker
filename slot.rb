class Slot
  attr_accessor :availability_status

  def initialize(args={})
    @availability_status = args[:availability_status]
  end
end