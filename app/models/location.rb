class Location < ActiveRecord::Base
  belongs_to :store
  validates_presence_of :store
  after_create :reverse_geocode
  after_create :assign_address_from_lookup

  reverse_geocoded_by :latitude, :longitude, address: :geocoded_location

  VERVE_COORDINATES = [33.1243208, -117.32582479999996]

  scope :for_store, -> (store_id) { where(store_id: store_id) }

  def self.by_distance
    all.sort_by(&:distance_from_verve)
  end

  def self.within_five_miles
    by_distance.select { |location| location.distance_from_verve.between?(0, 5) }
  end

  def distance_from_verve
    distance_from VERVE_COORDINATES
  end

  private

  def assign_address_from_lookup
    if self.geocoded_location
      self.address, self.city, state_with_zip = self.geocoded_location.split(",").map(&:lstrip)
      self.state, self.postal_code = state_with_zip.split(" ")
      self.country = "United States"
      save!
    end
  end
end
