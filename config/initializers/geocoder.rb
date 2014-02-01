Geocoder.configure(
  :cache => Redis.new,

  # set default units to kilometers
  units: :km
)
