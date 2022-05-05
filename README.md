# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| lastname           | string | null: false              |
| sub_lastname       | string | null: false              |
| name               | string | null: false              |
| sub_name           | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many   :comments
- has_many   :items
- has_many   :orders

## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| shipping_fee_id    | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| send_day_id        | integer    | null: false                   |
| price              | integer    | null: false                   
| user               | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_many   :comments

## comments テーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | -----------------------------------|
| content            | text       | null: false                        |
| user               | references | null: false , foreign_key: true|
| item               | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## deliveries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post               | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| town               | string     | null: false                    | 
| address            | string     | null: false                    |
| building           | string     |                                |
| tele_number        | string     | null: false                    |
| order              | references | null: false , foreign_key: true|

### Association 
- belongs_to :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association 
- belongs_to :user
- belongs_to :item
- has_one    :deliveriey
  