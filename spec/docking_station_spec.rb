require 'docking_station'
require 'bike'

describe DockingStation do
  it 'responds to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it ':release_bike returns a new bike' do
    subject.dock_bike(Bike.new)
    expect(subject.release_bike).to be_instance_of(Bike)
  end

  it ':release_bike does not return a bike if no bikes are present' do
    expect { subject.release_bike }.to raise_error(RuntimeError)
  end

  it ':dock_bike does not add a bike if bike is present' do
    subject.dock_bike(Bike.new) 
    expect { subject.dock_bike(Bike.new) }.to raise_error(RuntimeError)
  end

  it ':dock_bike adds a bike' do
    expect(subject.dock_bike(Bike.new)).to be_instance_of(Bike)
  end
end
