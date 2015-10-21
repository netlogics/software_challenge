require 'csv'

class LocationsImportWorker
  include Sidekiq::Worker

  def perform(filename, store_id)
    file = StoreLocationsUploader.new
    file.retrieve_from_store!(filename)
    CSV.foreach(file.path, {col_sep: "\t", headers: true}) do |row|
      store = Store.find_or_create_by id: store_id
      store.try(:locations).create latitude: row[6], longitude: row[7]
    end
  rescue StandardError => ex
    logger.error ex.message
  end
end
