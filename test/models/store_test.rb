require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  def setup
    @store = FactoryGirl.create :store
    FactoryGirl.create_list :location, 10, store: @store
  end

  test 'can create an Store' do
    assert_instance_of Store, @store
  end

  test 'can create a Store with a name' do
    assert_not_nil store = FactoryGirl.create(:store)
    assert_equal 'Caribou Coffee', store.name
  end

  test 'can update an Store' do
    @store.name = 'Acme Updated'
    assert @store.save!
    assert_equal 'Acme Updated', @store.name
  end

  test 'name can not be nil' do
    assert_raises (ActiveRecord::RecordInvalid) { FactoryGirl.create(:store, name: nil) }
  end

  test 'can delete a Store' do
    assert @store.delete
  end

  test 'references locations' do
    assert_instance_of Location, @store.locations.first
    assert_equal 10, @store.locations.count
  end

end
