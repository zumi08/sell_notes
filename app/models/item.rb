class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessor :file
end
