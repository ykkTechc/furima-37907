# class CreateItems < ActiveRecord::Migration[6.0]
#   def change
#     create_table :items do |t|
#       t.string      :title
#       t.text        :explanation
#       t.integer     :category_id
#       t.integer     :status_id
#       t.integer     :shipping_fee_id
#       t.integer     :prefecture_id
#       t.integer     :send_day_id
#       t.integer     :price
#       t.references  :user,  null: false, foreign_key: true

#       t.timestamps
#     end
#   end
# end
