require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'rail_road'
=begin
rr = RailRoad.new
train = PassengerTrain.new("123po")
train.attach_wagon

train1 = CargoTrain.new("123io")
train1.attach_wagon

train2 = CargoTrain.new("123xo")
train2.attach_wagon

rr.send(:create_station)
rr.send(:create_station)
rr
station = rr.stations[0]
station.accept_train(train)
station.accept_train(train2)
station1 = rr.stations[1]
station1.accept_train(train1)
wagon = train.wagons[0]
wagon.take_seat
wagon1 = train1.wagons[0]
wagon1.take_volume(50)
station.view_wagons
station1.view_wagons
=end