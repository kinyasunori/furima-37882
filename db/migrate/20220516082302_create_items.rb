class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :user,                 null: false
      t.string     :product,              null: false
      t.text       :explanation,          null: false
      t.integer    :category_id,          null: false
      t.integer    :condition_id,         null: false
      t.integer    :postage_id,           null: false
      t.integer    :prefecture_id,        null: false
      t.integer    :preparation_days_id,  null: false
      t.integer    :price,                null: false
      
      t.timestamps
    end
  end
end
