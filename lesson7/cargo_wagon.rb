class CargoWagon < Wagon

  def initialize(volume, number)
    super(:Cargo, number, volume)
  end

  def take_volume(vol)
    raise "Весь объем занят" if @free_place - vol < 0
    @used_place += vol
  end
end
