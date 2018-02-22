require 'bike'

class DockingStation
  def release_bike
    bike = Bike.new
  end


end


#   attr_reader :bike
#
#   def release_bike
#     Bike.new
#   end
#
#   def dock(bike)
#     @bike = bike
#   end
#
#   def bike_available?
#     if !@bike == true
#       raise "Sorry, no bike in the dock"
#     end
#   end
#
# end
#
# class Bike
#   def working?
#     true
#   end
