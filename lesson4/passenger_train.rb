class PassengerTrain < Train
  attr_reader :type, :wagons

  def initialize(number)
    @wagons = []
    @number = number
    @type = :passenger
    @speed = 0
  end
end
