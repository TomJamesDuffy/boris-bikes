require 'docking_station'
require 'bike'

describe DockingStation do
  it 'responds to :release_a_bike' do
    expect(subject).to respond_to :release_bike
  end

  # bike = Bike.new
  # docking_station = DockingStation.new
  #
  # expect()

  # it { should respond_to(:release_bike, :bike_available?) }
  # it { expect(subject.release_bike).to be_a Bike }
  # it { expect(subject.release_bike.working?).to eq true }
  # it { should respond_to(:dock).with(1).argument }
  # it { expect(subject.dock(bike)).to eq bike }
  # it { expect { subject.bike_available? }.to raise_error("Sorry, no bike in the dock") }
end
