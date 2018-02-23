require './lib/bike.rb'

class Garage
  attr_accessor :bikes

  def initialize
    @bikes = Array.new
  end

  def fix_bikes
    @bikes.each {|b| b.working = true}
  end
end
