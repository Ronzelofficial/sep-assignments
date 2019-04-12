#https://stackoverflow.com/questions/12966638/how-to-calculate-the-distance-between-two-gps-coordinates-without-using-google-m
  RAD_PER_DEG = Math::PI / 180
  RM = 6371000 # Earth radius in meters
#i got the distance between function from online, then i used that to make the algorithm acutally functional with locations id like to visit. 
def distance_between(lat1, lon1, lat2, lon2)

  lat1_rad, lat2_rad = lat1 * RAD_PER_DEG, lat2 * RAD_PER_DEG
  lon1_rad, lon2_rad = lon1 * RAD_PER_DEG, lon2 * RAD_PER_DEG

  a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

  RM * c # Delta in meters
end

#the above calculation was taken from google. I just searched for code to convert lat, lot, of two places into distance. I put it at the top of the file for clarity and transparency

class City
  attr_accessor :name
  attr_accessor :lat
  attr_accessor :lon

  def initialize(name, lat, lon)
    @name = name
    @lat = lat
    @lon = lon
  end
end

#takes list of cities, and starting location
def nearest_neighbor(itinirary, current_place)
  route = []
  while itinirary[0] != nil
    next_place = itinirary[0]
    itinirary.each do |potential_route|
      next_place_distance = distance_between(current_place.lat, current_place.lon, next_place.lat, next_place.lon)
      potential_route_distance = distance_between(current_place.lat, current_place.lon, potential_route.lat, potential_route.lon)
      if next_place_distance >= potential_route_distance
        next_place = potential_route
      end
    end
    current_place = next_place
    itinirary.delete(next_place)
    route.push(current_place.name)
  end
  route
end

home = City.new("San Diego", 32.7157, 117.1611)
city1 = City.new("Athens", 37.9838, 23.7275)
city2 = City.new("Tel Aviv", 32.0853, 34.7818)
city3 = City.new("Milan", 45.4642, 9.1900)
city4 = City.new("Zagreb", 45.8150, 15.9819)
city5 = City.new("Berlin", 52.5200, 13.4050)

itinirary = [city1, city2, city3, city4, city5]
p trip_route = nearest_neighbor(itinirary, home)
