# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| name         | string | null: false |
| name_reading | string | null: false |
| password     | string | null: false |
| birth        | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options                            |
| ----------------------- | ---------- | ---------------------------------- |
| item_name               | string     | null: false                        |
| image                   | string     | null: false                        |
| category                | string     | null: false                        |
| price                   | integer    | null: false                        |
| text                    | text       | null: false                        |
| item_status             | string     | null: false                        |
| shipping_cost           | integer    | null: false                        |
| shipping_area           | string     | null: false                        |
| scheduled_shipping_date | string     | null: false                        |
| user_id                 | references | null: false, foreign_key: true     |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| card_number | integer    | null: false                    |
| exp_year    | integer    | null: false                    |
| exp_month   | integer    | null: false                    |
| cvc         | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

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