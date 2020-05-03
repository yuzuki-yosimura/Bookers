class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]
  has_many :post_feelings, dependent: :destroy
  has_many :books, dependent: :destroy
  attachment :profile_image

  #名前と自己紹介文のバリデーション
  validates :introduction, length: { maximum: 50 }
  validates :name, length: { minimum: 2, maximum: 20 }

  #nameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    #認証の条件式を変更する
    where(conditions).where(["name = :value", { :value => name }]).first
  else
    where(conditions).first
  end
end

  #エラー文にデフォルトでメッセージを加える
  def a_method_used_for_validation_purposes
    errors[:base] << "error!"
  end

end
