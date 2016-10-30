class City
  attr_reader :lat, :lng, :name

  def initialize(name)
    @name = name
    location = get_location(name)
    @lat = location["lat"]
    @lng = location["lng"]
  end

  def distance_to (other_city)
    #calculates distance between lat/lng points using haversine forumula
    r = 6371 #radius of earth in km
    lat1 = lat * Math::PI / 180
    lat2 = other_city.lat * Math::PI / 180
    lat_delta = lat2 - lat1
    lng_delta = (other_city.lng - lng) * Math::PI / 180
    a = Math.sin(lat_delta / 2) * Math.sin(lat_delta / 2) +
        Math.cos(lat1) * Math.cos(lat2) *
        Math.sin(lng_delta / 2) * Math.sin(lng_delta / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    r * c
  end

  private

  def get_location (name)
    #uses Geocoder gem to find latitude and longitude of city
    Geocoder.search(name).first.data["geometry"]["location"]
  end
end
