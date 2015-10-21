require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = FactoryGirl.create :location
  end

  test 'for_store returns store locations' do
    Location.for_store(@location.store_id).each do |location| 
      assert_equal @location.store_id, location.store_id
    end
  end

end
