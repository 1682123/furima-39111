## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## Association
- has_many :items
- has_many :orders
- has_many :buyer_records

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | string     | null: false                    |
| item_condition   | string     | null: false                    |
| shipping_fee     | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_day     | string     | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | text       | null: false                    |
| building     | text       |                                |
| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_many :buyer_records

## buyer_records 
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| order_id | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :order