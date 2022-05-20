class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      
      t.string :product,             null: false, default: ""
      t.string :explanation,         null: false, default: ""
      t.string :category_id,         null: false, default: ""
      t.string :condition_id,        null: false, default: ""
      t.string :postage_id,          null: false, default: ""
      t.string :prefecture_id,       null: false, default: ""
      t.string :preparation_days_id, null: false, default: ""
      t.string :price,               null: false, default: ""

      t.timestamps
    end
  end
end
