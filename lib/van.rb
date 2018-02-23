require './lib/docking_station.rb'
require './lib/bike.rb'

class Van
  attr_reader :bikes

  def initialize
    @bikes = Array.new 
  end

  def instruction(location, is_working, action)
    @location, @is_working, @action = location, is_working, action
    go_to_location
  end

  private
  def go_to_location
    return load_bikes if @action == "pickup" 
    return drop_bikes if @action == "dropoff" 
    fail 'Could not read action' 
  end

  def load_bikes
    adjustment = @location.bikes.select {|b| b.working == @is_working }
    @bikes += adjustment
    @location.bikes -= adjustment 
  end
  
  def drop_bikes
    @location.bikes += @bikes
    @bikes = []
  end
end

