# FURIMAアプリのテーブル設計

## users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ------------|
| nickname         | string | null: false |
| emails           | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many :items
- has_one :ship_address
- has_one :card

## items テーブル

| Column         | Type       | Options                     |
| ---------------| -----------|-----------------------------|
| item_image     | string     | null: false                 |
| item_name      | string     | null: false                 |
| item_detail    | text       | null: false                 |
| item_category  | integer    | null: false                 |
| item_condition | integer    | null: false                 |
| shipping_cost  | integer    | null: false                 |
| prefecture_id  | integer    | null: false                 |
| shipping_days  | integer    | null: false                 |
| item_price     | integer    | null: false                 |
| user_id        | references | null:false,foreign_key:true |


### Association

- belongs_to :user

## cards テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| card_id   | integer    | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user  # usersテーブルとのアソシエーション

## ship_addresses

| Column        | Type       | Options                     |
| --------------| ---------- | --------------------------- |
|post_code      | integer    | null:false                  |
|Prefecture     | integer    | null:false                  |
|city           | string     | null:false                  |
|address        | string     | null:false                  |
|building_name  | string     |                             |
|phone_number   | integer    | null:false                  |
|user_id        | references | null:false,foreign_key:true |


### Association
- belongs_to :user