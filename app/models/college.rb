class College < ActiveRecord::Base
  has_many :users
  has_many :items
  has_many :lecture_informations
  belongs_to :university
end
