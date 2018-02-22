require './lib/bike.rb'

class DockingStation
  attr_reader :bike

  def release_bike
    fail if @bike.nil?
    Bike.new
  end

  def dock_bike(bike)
    @bike = bike
  end
end
