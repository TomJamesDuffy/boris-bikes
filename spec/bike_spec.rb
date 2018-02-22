require 'bike'

describe Bike do
  it 'responds to :working' do
    expect(subject.working).to eq(true)
  end

  it 'if bike is broken, return broken' do
    subject.working = false
    expect(subject.working).to eq(false)
  end
end
