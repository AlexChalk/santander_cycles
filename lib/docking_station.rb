# in lib/docking_sation.rb
require './lib/bike.rb'
require './lib/van.rb'
require './lib/garage.rb'

class DockingStation

  attr_reader :capacity
  attr_accessor :working_bikes, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @working_bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise('Error: no bikes available at this docking station.') if empty?
    working_bikes.pop
  end

  def dock(bike)
    raise('Error: this docking station is occupied.') if full?
    bike.broken? ? broken_bikes << bike : working_bikes << bike
  end

  def bikes
    working_bikes + broken_bikes
  end

  def collect_working_bikes_from(sender)
    until sender.working_bikes.empty? do
      working_bikes << sender.working_bikes.pop
    end
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    working_bikes.empty?
  end

end
