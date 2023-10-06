# frozen_string_literal: true

class CargoWagon < Wagon
  def initialize(volume, number)
    super(:Cargo, volume, number)
  end

  def take_volume(vol)
    raise 'Весь объем занят' if (@free_place - vol).negative?

    @used_place += vol
  end
end
