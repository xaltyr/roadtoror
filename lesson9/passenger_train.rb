# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    @type = 'Passenger'
    super
  end
end
