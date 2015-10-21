class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :locations_for_store?

  def index
    @store = Store.find params[:store_id]
  end

  def new
    @location = Location.new
  end

  def import
    @store = Store.find params[:store_id]
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to store_location_path(@location.store_id, @location), notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to store_location_path(@location.store_id, @location), notice: 'Location was successfully updated.'
    else
      render :edit
    end
  end

  def upload
    file = params[:store][:locations_file]
    uploader = StoreLocationsUploader.new
    uploader.store! file
    LocationsImportWorker.perform_async(file.original_filename, params[:store_id])
    redirect_to store_locations_path
  end

  def destroy
    @location.destroy
    redirect_to store_locations_url(@location.store_id), notice: 'Location was successfully destroyed.'
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:store_id, :business_name, :latitude, :longitude, :address, :city, :state, :postal_code, :country)
    end

    def locations_for_store?
      params.include?(:store_id) ? locations_for_store : all_locations
    end

    def locations_for_store
      @locations = Location.for_store(params[:store_id]).by_distance
    end

    def all_locations
      @locations = Location.by_distance
    end
end
