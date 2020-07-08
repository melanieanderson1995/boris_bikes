require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      expect(bike).to be_working
    end

    it "raises error when no bikes available" do
      expect{ subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe "#dock" do
    it "raises an error when full" do
      20.times{ subject.dock Bike.new }
      expect{ subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end

  it "docks the bike" do
    bike = subject.dock(bike)
    expect(subject.dock(bike)).to eq bike
  end

  it "checks for bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end
end
