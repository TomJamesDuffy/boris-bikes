require './lib/bike.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_accessor :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty_of_working?
    @bikes.delete(working_bikes[0])
  end

  def dock_bike(bike)
    fail 'Not enough space available' if full?
    @bikes.push(bike)
  end

  def empty_of_working?
    return true if working_bikes.empty?
    false
  end

  def full?
    @bikes.length >= @capacity
  end

  def working_bikes
    @bikes.select { |bike| bike.working == true }
  end
end
