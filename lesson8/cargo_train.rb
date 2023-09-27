# frozen_string_literal: true

class CargoTrain < Train
  def initialize(number)
    @type = 'Cargo'
    super
  end
end
