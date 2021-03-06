require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = FactoryGirl.create :location
  end

  test "should get index" do
    get :index, store_id: @location.store_id
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get import" do
    get :import, store_id: @location.store_id
    assert_response :success
    assert_not_nil assigns(:store)
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address: @location.address, city: @location.city, country: @location.country, latitude: @location.latitude, longitude: @location.longitude, postal_code: @location.postal_code, state: @location.state, store_id: @location.store_id }
    end

    assert_redirected_to store_location_path(@location.store_id, assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, location: { address: @location.address, city: @location.city, country: @location.country, latitude: @location.latitude, longitude: @location.longitude, postal_code: @location.postal_code, state: @location.state, store_id: @location.store_id }
    assert_redirected_to store_location_path(@location.store_id, assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to store_locations_url(@location.store_id)
  end
end
