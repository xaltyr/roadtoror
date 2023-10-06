# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validation'

class Train
  extend Manufacturer
  include InstanceCounter
  include Validation

  attr_reader :number, :speed, :type, :wagons, :route

  @@all_instances = []
  validate :number, :format, /^[a-z0-9]{3}-{0,1}[a-z0-9]{2}$/
  validate :number, :presence
  validate :number, :type, String

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@all_instances << self
    puts "Создан поезд #{self}"
    register_instance
  end

  def stop
    @speed = 0
  end

  def go(speed)
    @speed = speed
  end

  def attach_wagon
    raise 'Поезд на ходу!' if @speed.positive?

    wagon = create_wagon
    attach_wagon!(wagon) if wagon
  end

  def create_wagon
    case type
    when 'Cargo'
      create_cargo_wagon
    when 'Passenger'
      create_passenger_wagon
    else
      raise 'Неверный тип вагона'
    end
  end

  def create_cargo_wagon
    puts 'Введите количество объема:'
    volume = gets.chomp.to_i
    puts 'Введите номер вагона:'
    number = gets.chomp.to_i
    CargoWagon.new(volume, number)
  end

  def create_passenger_wagon
    puts 'Введите количество мест:'
    seats = gets.chomp.to_i
    puts 'Введите номер вагона:'
    number = gets.chomp.to_i
    PassengerWagon.new(seats, number)
  end

  def dispatch_wagon
    wagons.delete_at(0)
  end

  def accept_route(route)
    @route = route
    @current_station_index = 0
    current_station.accept_train(self)
  end

  def go_next_station
    raise 'Поезд на конечной станции' unless current_station != @route.stations.last

    @current_station_index += 1
    current_station.accept_train(self)
    previous_station.send_train(self)
  end

  def go_previous_station
    raise 'Поезд на начальной станции' unless current_station != @route.stations.first

    @current_station_index -= 1
    current_station.accept_train(self)
    previous_station.send_train(self)
  end

  def self.find(number)
    @@all_instances.find { |train| train.number == number }
  end

  def each_wagon(&block)
    wagons.each { |wagon| block.call(wagon) }
  end

  protected

  def validate_format_number
    validate!
  rescue StandardError => e
    puts "Ошибка #{e.message}"
    puts 'Введите данные заново'
    @number = gets.chomp
    retry if number !~ REGEXP
  end

  # Вспомогательный метод

  private

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end

  def attach_wagon!(wagon)
    wagons << wagon
  end
end
