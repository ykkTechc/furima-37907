# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
|                    |        | unipue: true|
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| lastname           | string | null: false |
| name               | string | null: false |
| birthday           | string | null: false |

### Association

- has_many   :items
- has_many   :orders

## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| explan             | text       | null: false                   |
| category           | string     | null: false                   |
| status             | string     | null: false                   |
| load               | string     | null: false                   |
| place              | string     | null: false                   |
| day                | string     | null: false                   |
| user               | references | null: false,foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- belongs_to :order

## comments テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text   | null: false |

### Association

- belongs_to :users
- belongs_to :items

## sends テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post               | string     | null: false                    |
| prefecture         | text       | null: false                    |
| town               | string     | null: false                    | 
| address            | string     | null: false                    |
| building           | string     |                                |
| tele_number        | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association 
- has_one :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| item               | references |                                |


### Association 
- belongs_to :user
- belongs_to :send
- has_one    :item