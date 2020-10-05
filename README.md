# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category_id      | integer    | null: false, foreign_key: true |
| description      | text       | null: false                    |
| condition_id     | integer    | null: false, foreign_key: true |
| buyer_burden_id  | integer    | null: false, foreign_key: true |
| prefecture_id    | integer    | null: false, foreign_key: true |
| delivery_time_id | integer    | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases
- belongs_to :category
- belongs_to :condition
- belongs_to :buyer_burden
- belongs_to :prefecture
- belongs_to :delivery_time

## purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| prefecture_id | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :prefecture

## category(Active_hash)

| Column   | Type   | Options     |
| -------- | -------| ----------- |
| category | string | null: false |

### Association

- has_many:items

## condition(Active_hash)

| Column    | Type   | Options     |
| --------- | -------| ----------- |
| condition | string | null: false |

### Association

- has_many:items

## buyer_burden(Active_hash)

| Column       | Type   | Options     |
| ------------ | -------| ----------- |
| buyer_burden | string | null: false |

### Association

- has_many:items

## prefecture(Active_hash)

| Column     | Type   | Options     |
| ---------- | -------| ----------- |
| prefecture | string | null: false |

### Association

- has_many:items
- has_many:addresses

## delivery_time(Active_hash)

| Column        | Type   | Options     |
| ------------- | -------| ----------- |
| delivery_time | string | null: false |

### Association

- has_many:items