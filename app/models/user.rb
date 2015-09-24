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
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def display_name
    "#{first_name} #{last_name[0]}."
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
