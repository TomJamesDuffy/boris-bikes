require './lib/docking_station.rb'
require './lib/bike.rb'
require './lib/garage.rb'

class Van
  attr_reader :bikes, :location, :is_working, :action

  def initialize
    @bikes = Array.new 
  end

  def get_instructions(location, is_working, action)
    @location, @is_working, @action = location, is_working, action
    fail "inappropriate input" if location_err || working_err || action_err
  end

  def select_bikes
    @location.bikes.select {|b| b.working == @is_working }
  end

  def remove_bikes_at_location
    @location.bikes -= select_bikes 
  end

  def drop_bikes_at_location
    fail 'bikes already dropped' if @location.bikes.include? @bikes
    @location.bikes += @bikes
  end

  def load_bikes_into_van
    fail 'bikes already loaded' if @bikes.include? select_bikes
    @bikes += select_bikes
  end

  def remove_bikes_from_van
    @bikes.clear
  end

  private
  def location_err
    return false if @location.class != DockingStation || @location.class != Garage
    true
  end

  def working_err
    return false if @is_working != false || @is_working != true
    true
  end

  def action_err
    return false if @action == "pickup" || @action == "dropoff"
    true
 end
end
