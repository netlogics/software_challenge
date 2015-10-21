class Account < ActiveRecord::Base
  has_many :stores

  validates_presence_of :name
end
