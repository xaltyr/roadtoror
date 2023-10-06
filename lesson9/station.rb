# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  include Validation
  include InstanceCounter
  @@all_instances = []
  attr_reader :trains
  attr_accessor :name

  validate :name, :presence

  def initialize(name)
    @name = name
    @trains = []
    @@all_instances << self
    length_validate!
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

  def each_train(&block)
    @trains.each { |train| block.call(train) }
  end

  protected

  def length_validate!
    raise 'Длинна имени не должна превышать 8 символов' if name.length > 8
  end
end
