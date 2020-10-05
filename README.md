# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| birthday   | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| category      | text       | null: false                    |
| description   | string     | null: false                    |
| condition     | string     | null: false                    |
| buyer_burden  | string     | null: false                    |
| prefecture    | string     | null: false                    |
| delivery_time | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

## purchasesテーブル

| Column        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal        | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association

belongs_to :purchase
