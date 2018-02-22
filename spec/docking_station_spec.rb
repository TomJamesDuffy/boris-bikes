require 'docking_station'
require 'bike'

describe DockingStation do

  describe ':release_bike' do

    it 'response' do
      expect(subject).to respond_to :release_bike
    end

    it 'returns a new bike' do
      subject.dock_bike(Bike.new)
      expect(subject.release_bike).to be_instance_of(Bike)
    end

    it 'does not return a bike if no bikes are present' do
      expect { subject.release_bike }.to raise_error(RuntimeError)
    end

    it 'should not release bike if not working' do
      bike = Bike.new
      bike.working = false
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error(RuntimeError)
    end
  end

  describe ':dock_bike' do

    it 'does not add a bike if 20 bikes are present' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(Bike.new) }
      expect { subject.dock_bike(Bike.new) }.to raise_error(RuntimeError)
    end

    it 'adds a bike' do
      expect(subject.dock_bike(Bike.new)).to be_instance_of(Bike)
    end
  end

  describe ':capacity' do

    it 'to equal 21' do
      docking_station = DockingStation.new(21)
      expect(docking_station.capacity).to eq(21)
    end
  end
end
