require 'bike'

describe Bike do
  subject { Bike.new }

  it { should respond_to(:working?) }

  it 'responds to :working?' do
    expect(subject.working?).to eq true
  end


end
