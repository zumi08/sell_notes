class College < ActiveRecord::Base
  has_many :users
  has_many :items
  belongs_to :university
end
