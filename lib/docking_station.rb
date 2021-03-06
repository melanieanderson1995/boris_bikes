require_relative 'bike'

class DockingStation
  attr_reader :capacity, :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty? || @broken == true
    bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    bikes << bike
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end
end
