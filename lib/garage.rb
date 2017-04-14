require "./lib/bike_container.rb"
class Garage

  include BikeContainer

  def fix_broken_bikes
    self.working_bikes = broken_bikes
    self.broken_bikes = []
    self.working_bikes = self.working_bikes.each{|bike| bike.broken = false}
  end

end
