# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
|                    |        | ユニーク制約  |
| encrypted_password | string | null: false |
| name               | string | null: false |
| birthday           | string | null: false |

### Association

- has_many   :prototypes
- has_many   :user
- belongs_to :sends
- belongs_to :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | text       | null: false |
| text               | text       | null: false |
| category           | string     | null: false |
| status             | string     | null: false |
| load               | string     | null: false |
| place              | string     | null: false |
| day                | string     | null: false |
| user               | references | null: false |

### Association

- has_many   :comments
- belongs_to :user

## nomments テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text   | null: false |

### Association

- belongs_to :users
- belongs_to :items

## sends テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post               | text       | null: false |
| prefecture         | text       | null: false |
| town               | string     | null: false |
| address            | string     | null: false |
| building           | string     | null: false |
| tele_number        | string     | null: false |
| user               | references | null: false |

### Association 
- has_one :user
- has_one :order

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | text       | null: false |
| price              | string     | null: false |
| user               | references | null: false |

### Association 
- has_one    :user
- belongs_to :sends