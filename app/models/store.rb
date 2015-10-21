class Store < ActiveRecord::Base
  has_many   :locations
  belongs_to :account

  validates_presence_of :account, :name
end
