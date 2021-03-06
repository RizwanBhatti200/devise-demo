class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates  :email, uniqueness: true, presence: true

  has_one_attached :picture 
  has_one_attached :avatar 
  #  styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def send_email
    UserMailer.delay.thank_you_mail(self)

  end
  

end

