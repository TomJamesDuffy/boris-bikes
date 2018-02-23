require 'bike'
require 'garage'

describe Garage do

  describe ":fix_bikes" do

    it 'response' do
      expect(subject).to respond_to :fix_bikes
    end

    it 'fixes all broken bikes in the bikes object' do
      bike = Bike.new
      subject.bikes.push(bike)
      bike.working = false
      fixed_bike = subject.fix_bikes
      expect(fixed_bike[0].working).to eq(true)
    end
  end
end
