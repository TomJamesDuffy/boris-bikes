require 'bike'
require 'garage'

describe Garage do

  describe ":fix_bikes" do

    it 'fixes all broken bikes in the bikes object' do
      bike = Bike.new
      subject.bikes.push(bike)
      bike.working = false
      fixed_bike = subject.fix_bikes
      expect(fixed_bike[0].working).to eq(true)
    end
  end
end

# Testing needs to be de-coupled from bike class.
