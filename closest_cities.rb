require 'geocoder'
require_relative './lib/city'
require_relative './lib/company'

HIRED_CITIES = ['Los Angeles, CA',
          'San Francisco, CA',
          'Boston, MA',
          'New York, NY',
          'Washington DC',
          'Seattle, WA',
          'Austin, TX',
          'Chicago, IL',
          'San Diego, CA',
          'Denver, CO',
          'London, UK',
          'Toronto, ON',
          'Sydney, AU',
          'Melbourne, AU',
          'Paris, FR',
          'Singapore']

hired = Company.new("Hired", HIRED_CITIES)
puts hired.find_closest_locations
