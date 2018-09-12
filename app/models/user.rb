class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  # :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name, :phone

  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
