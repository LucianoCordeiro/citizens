Geocoder.configure(
  lookup: :google,
  api_key: Rails.application.credentials.geocoder[:api_key]
)
