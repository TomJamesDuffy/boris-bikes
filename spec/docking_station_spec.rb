require 'docking_station'
require 'bike'

describe DockingStation do
  it 'responds to :release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it ':release_bike returns a new bike' do
    expect(subject.release_bike).to be_instance_of(Bike)
  end
end
