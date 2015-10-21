require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = FactoryGirl.create :account
  end

  test 'can create an Account' do
    assert_instance_of Account, @account
  end

  test 'can update an Account' do
    @account.name = 'Acme Updated'
    assert @account.save!
    assert_equal 'Acme Updated', @account.name
  end

  test 'name can not be nil' do
    assert_raises (ActiveRecord::RecordInvalid) { FactoryGirl.create(:account, name: nil) }
  end

  test 'can delete an Account' do
    assert Account.new.delete
  end

end
