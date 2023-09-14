require_relative 'instance_counter'
require_relative 'valid'

class Station
  @@all_instances = []
  include InstanceCounter, Valid
  attr_reader :trains
  attr_accessor :name

  def initialize(name)
    @name = name
    @trains = []
    @@all_instances << self
    validate!
  end

  def accept_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def self.all
    @@all_instances
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "Имя должно содержать символы" if name == ""
    raise "Длинна имени не должна превышать 8 символов" if name.length > 8
  end
end

