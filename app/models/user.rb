class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #        validates :username,
  # :presence => true,
  # :uniqueness => {
  #   :case_sensitive => false
  # }

  def display_name
    "#{first_name} #{last_name[0]}."
  end
end
