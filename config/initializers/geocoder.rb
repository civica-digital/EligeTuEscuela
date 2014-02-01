Geocoder.configure(
  :cache => Redis.new(password: ENV['REDIS_KEY']),

  # set default units to kilometers
  units: :km
)
