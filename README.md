# テーブル設計

## users テーブル

| Column           | Type    | Options                   |
| ---------------- | ------  | ------------------------- |
| nickname         | string  | null:false                |
| email            | string  | null:false , unique: true |
| password         | string  | null:false                |

### Association
- has_many:reviews
- has_many:goods


## shops

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| name     | string     | null:false                    |
| text     | text       | null:false                    |
| genre    | string     | null:false                    | 
| area     | string     | null:false                    | 

### Association
- has_many:goods
- has_many:menus
- has_many:reviews


## goods テーブル

| Column   | Type     | Options                       |
| -------- | -------- | ----------------------------- |
| user_id  | integer  | null:false, foreign_key: true |
| shop_id  | integer  | null:false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: shop

## reviews テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null:false                     |
| text     | text       | null:false                     |
| rate     | float      | null:false                     |
| user_id  | integer    | null:false                     |
| shop_id  | integer    | null:false                     |

### Association
- belongs_to: shop
- belongs_to: user


## menus テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null:false                     |
| price    | integer    | null:false                     |
| shop_id  | integer    | null:false                     |

### Association
- belongs_to: shop
