class Book < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence:{message: "must be filled in"}
  validates :body, length: { maximum: 50 }
  validates :title, length: { maximum: 20 }

  def a_method_used_for_validation_purposes
    errors[:base] << "error!"
  end

end  
