class PassengerTrain < Train
  attr_reader :type, :wagons

  def initialize(number)
    @wagons = []
    @number = number
    @type = :passenger
  end

end
