class Company
  attr_reader :name, :locations

  def initialize(name, cities)
    @name = name
    @locations = get_locations(cities)
  end

  def find_closest_locations
    closest_cities = nil
    closest_distance = 40075 #circumference of earth in km

    #for each pair of cities, find the distance and compare it to the closest distance
    (0...locations.length - 1).each do |i|
      city1 = locations[i]
      (i + 1...locations.length).each do |j|
        city2 = locations[j]
        distance = city1.distance_to(city2)
        if distance < closest_distance
          closest_distance = distance
          closest_cities = [city1.name, city2.name]
        end
      end
    end
    closest_cities
  end

  private

  def get_locations (cities)
    cities.map { |city| City.new(city) }
  end
end
