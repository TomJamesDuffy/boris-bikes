require 'van'
require 'bike'
require 'docking_station'

describe Van do
let(:dummy_bike) { double :dummy_bike }
let(:dummy_station) { double :dummy_station }

  describe ':instruction' do
    
    it 'responds' do
      expect(subject).to respond_to :instruction
    end
  end  

  describe ':bikes' do
  
    it 'increase when bikes are loaded' do
      allow(dummy_bike).to receive(:working).and_return(true)
      station = DockingStation.new
      station.dock_bike(dummy_bike)
      subject.instruction(station, true, "pickup")
      expect(subject.bikes.length).to eq(1)
    end

    it 'decreases when bikes are dropped off' do
      allow(dummy_bike).to receive(:working).and_return(true)
      station = DockingStation.new
      station.dock_bike(dummy_bike)
      subject.instruction(station, true, "pickup")
      subject.instruction(station, true, "dropoff")
      expect(subject.bikes.length).to eq(0)
    end
  end
  
  describe 'go_to_location' do
    
    it 'raises error if commands do not make sense' do
      station = DockingStation.new
      station.dock_bike(dummy_bike)
      expect { subject.instruction(station, true, "cake") }.to raise_error(RuntimeError)
    end
  end
end
