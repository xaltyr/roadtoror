require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :trains, :name
  @@all_instances = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_instances << self
    register_instance
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
end

