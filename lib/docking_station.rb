require './lib/bike.rb'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    fail 'Not enough space available' if full? 
    @bikes.push(bike)[-1]
  end

  private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length >= 20
  end
end
