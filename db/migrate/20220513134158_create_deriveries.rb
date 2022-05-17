class CreateDeriveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deriveries do |t|

      t.string     :post
      t.string     :town
      t.string     :address
      t.string     :building
      t.string     :tele_number
      t.integer    :prefecture_id
      t.references :order,  null: false, foreign_key: true

   

      t.timestamps
    end
  end
end
