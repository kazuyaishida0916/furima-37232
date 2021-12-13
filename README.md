# FURIMAアプリのテーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | --------------------------|
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | data   | null: false               |

### Association

- has_many :items
- has_many :cards

## items テーブル

| Column            | Type       | Options                     |
| ------------------| -----------|-----------------------------|
| item_name         | string     | null: false                 |
| item_detail       | text       | null: false                 |
| item_category_id  | integer    | null: false                 |
| item_condition_id | integer    | null: false                 |
| shipping_cost_id  | integer    | null: false                 |
| prefecture_id     | integer    | null: false                 |
| shipping_days_id  | integer    | null: false                 |
| item_price        | integer    | null: false                 |
| user              | references | null:false,foreign_key:true |


### Association

- belongs_to :user
- has_one :card

## cards テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :ship_address

## ship_addresses

| Column        | Type       | Options                     |
| --------------| ---------- | --------------------------- |
|post_code      | string     | null:false                  |
|prefecture_id  | integer    | null:false                  |
|city           | string     | null:false                  |
|address        | string     | null:false                  |
|building_name  | string     |                             |
|phone_number   | string     | null:false                  |
|card           | references | null:false,foreign_key:true |


### Association
- belongs_to :card