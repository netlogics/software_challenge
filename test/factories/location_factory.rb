FactoryGirl.define do
  factory :location do
    store
    latitude 0
    longitude 0
    address '123'
    city 'San Diego'
    state 'CA'
    postal_code '92101'
    country 'United States'

    factory :verve do
      latitude 32.7073
      longitude 117.1566
    end
  end
end
