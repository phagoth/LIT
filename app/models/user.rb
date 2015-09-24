class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, format: { with: /\A[1-2]\d{3}-[0-1][0-9]-[0-3][0-9]\z/,
    message: "Введите дату в формате гггг-мм-дд" }
  validates :birthdate, date: { after_or_equal_to: Proc.new { Time.now - 150.years } }
  validates :phone, format: { with: /\A\d{3}-\d{7}\z/,
    message: "Введите номер телефона в формате ***-*******" }
  validates :login, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..16 }


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def display_name
    "#{first_name} #{last_name[0]}."
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
