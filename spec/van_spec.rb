require 'van'

describe Van do
let(:dummy_bike_working) { double :dummy_bike_working, working: true }
let(:dummy_bike_not_working) { double :dummy_bike_working, working: false }

  describe ':get_instructions' do

    it 'raises an error if input is not in an appropriate format' do
      expect{ subject.get_instructions("location", "is_working", "action") }.to raise_error(StandardError)
    end
  end

  describe ':select_bikes' do

    it 'identifies working bikes to be loaded' do
      dummy_station = double(:bikes => [].push(dummy_bike_working))
      subject.get_instructions(dummy_station, true, "pickup")
      expect(subject.select_bikes.length).to eq(1) 
    end
 end

  describe ':load_bikes_at_location' do

    it 'adds bikes to vans storage' do
      dummy_array = []
      dummy_station = double(:bikes => dummy_array.push(dummy_bike_working))
      subject.get_instructions(dummy_station, true, "pickup") 
      subject.select_bikes
      subject.load_bikes_into_van
      expect(subject.bikes.length).to eq(1) 
    end
  end
  
  # Tests to be written for :remove_bikes_at_location, drop_bikes_at_location, remove_bikes_from_van.
  # Tests to be written to confirm that error testing is working as expected.

end
