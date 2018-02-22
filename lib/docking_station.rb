require './lib/bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    fail 'No bikes available' unless @bike
    Bike.new
  end

  def dock_bike(bike)
    fail 'Bike is present' unless @bike.nil?
    @bike = bike
  end
end
