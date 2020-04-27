class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_feelings, dependent: :destroy
  attachment :profile_image

  def a_method_used_for_validation_purposes
    errors[:base] << "error!"
  end

  validates :introduction, length: { maximum: 50 }
  validates :name, length: { minimum: 2, maximum: 20 }


end
