class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items

  validates :name,
    uniqueness: { case_sensitive: :false },
    length: { minimum: 4, maximum: 20 }
  validates :email, presence: true, uniqueness: true
end
