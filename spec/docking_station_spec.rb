require 'docking_station'

describe DockingStation do
let(:dummy_bike_working) { double :dummy_bike_working, working: true }
let(:dummy_bike_not_working) { double :dummy_bike_not_working, working: false }

  describe ':capacity' do

    it 'capacity of 21 should overwrite the default value of 20' do
      docking_station = DockingStation.new(21)
      expect(docking_station.capacity).to eq(21)
    end
  end

  describe ':release_bike' do

    it 'returns bike' do
      subject.dock_bike(dummy_bike_working)
      expect(subject.release_bike).to eq(dummy_bike_working)
    end

    it 'reduces bikes available by one' do
      subject.dock_bike(dummy_bike_working)
      subject.release_bike
      expect(subject.bikes.length).to eq(0)
    end

    it 'does not return a bike if no bikes are present' do
      expect { subject.release_bike }.to raise_error(RuntimeError)
    end

    it 'should not release bike if not working' do
      subject.dock_bike(dummy_bike_not_working)
      expect { subject.release_bike }.to raise_error(RuntimeError)
    end
  end

  describe ':dock_bike' do

    it 'adds a bike' do
      subject.dock_bike(dummy_bike_working)
      expect(subject.bikes.length).to eq(1)
    end

    it 'does not add a bike if bikes exceeds capacity' do
      subject.capacity.times { subject.dock_bike(dummy_bike_working) }
      expect { subject.dock_bike(dummy_bike_working) }.to raise_error(RuntimeError)
    end
  end

  describe ':empty_of_working?' do

    it 'if there are no working bikes return true' do
      subject.dock_bike(dummy_bike_not_working)
      expect(subject.empty_of_working?).to eq(true)
    end
  end
  
  describe ':full?' do

    it 'returns true if there are more bikes than capacity' do 
      subject.capacity.times { subject.dock_bike(dummy_bike_working) }
      expect(subject.full?).to eq(true)
    end
  end  

  describe ':working_bikes' do

    it 'returns an array of working bikes' do 
      subject.dock_bike(dummy_bike_working) 
      subject.dock_bike(dummy_bike_not_working) 
      expect(subject.working_bikes.length).to eq(1)
    end
  end  
end
