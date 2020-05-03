class CreatePostFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :post_feelings do |t|
      t.text :title
      t.string :body
      t.integer :user_id
      t.timestamps
    end
  end
end
