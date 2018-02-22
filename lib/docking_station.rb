require './lib/bike.rb'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'Not enough space available' if (@bikes.length >= 20)
    @bikes.push(bike)[-1]
  end
end
