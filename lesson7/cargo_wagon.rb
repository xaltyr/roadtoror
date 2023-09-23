class CargoWagon < Wagon
  attr_reader :free_volume

  def initialize(volume, number)
    @volume = volume
    @free_volume = volume
    super(:Cargo, number)
  end

  def take_volume(vol)
    if @free_volume - vol < 0
      raise "Весь объем занят"
    else
      @free_volume -= vol
    end
  end

  def occupied_volume
    occupied_volume = @volume - @free_volume
    occupied_volume
  end
end