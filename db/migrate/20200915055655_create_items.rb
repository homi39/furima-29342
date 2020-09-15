class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                    null: false
      t.integer    :category_id,             null: false
      t.integer    :price,                   null: false
      t.text       :text,                    null: false
      t.integer    :status,                  null: false
      t.integer    :shipping_cost,           null: false
      t.integer    :shipping_area,           null: false
      t.integer    :scheduled_shipping_date, null: false
      t.references :user,                                 foreign_key: true
      t.timestamps
    end
  end
end
