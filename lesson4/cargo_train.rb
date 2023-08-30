class CargoTrain < Train
  attr_reader :type, :wagons

  def initialize(number)
    @wagons = []
    @number = number
    @type = :cargo
    @speed = 0
  end
end

