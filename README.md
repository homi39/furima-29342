# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| family_name      | string | null: false |
| family_name_kana | string | null: false |
| first_name       | string | null: false |
| first_name_kana  | string | null: false |
| password         | string | null: false |
| birth            | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options                            |
| ----------------------- | ---------- | ---------------------------------- |
| name                    | string     | null: false                        |
| category_id             | integer    | null: false                        |
| price                   | integer    | null: false                        |
| text                    | text       | null: false                        |
| user                    | references | null: false, foreign_key: true     |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_location


## delivery_locations テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order