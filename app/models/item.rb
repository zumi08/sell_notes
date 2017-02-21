class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :college
  has_many :upload_file
  attr_accessor :file
end
