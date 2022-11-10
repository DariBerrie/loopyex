class User < ApplicationRecord
  before_create :set_default_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :photo

  def set_default_avatar
    self.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images',
                                                    ["green_hat.png", "orange_hat.png", "panda_hat.png"].sample)),
                                                    filename: 'default-avatar.png', content_type: 'image/png')
  end
end
