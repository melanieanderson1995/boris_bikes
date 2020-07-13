require 'docking_station'
DEFAULT_CAPACITY = 20

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

    it "won't release broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error "No working bikes available"
    end

  describe "#dock" do
    it "raises an error when full" do
      subject.capacity.times{ subject.dock Bike.new }
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

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe "initialization" do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error "Docking station full"
    end
    it "has a variable capacity" do
      subject = DockingStation.new (10)
      10.times{ subject.dock Bike.new }
      expect{ subject.dock Bike.new }.to raise_error "Docking station full"
    end
  end
end
