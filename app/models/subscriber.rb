class Subscriber < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :name, :phone, :verified

  # validates :name, presence: true
  # validates :email, :phone, presence: true
  #uniqueness: true

end
