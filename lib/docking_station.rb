require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    @bikes.length >= @capacity
  end
end
