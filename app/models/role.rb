class Role < ActiveRecord::Base
#  attr_accessor :name
  validates_presence_of :name

  has_many :assignments
  has_many :users, :through => :assignments

end
