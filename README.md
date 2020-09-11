# Tama Ramen
多摩地区のラーメン屋をまとめました。<br>
近所の気になるお店や知らないお店の情報をあらかじめ知ることで<br>
後悔のないラーメンライフを送るために制作しています。

# ご利用方法
店名・ジャンル・エリアから各種検索ができます<br>
お店の詳細ページから評価と口コミが投稿できます<br>
行ったお店とお気に入りのお店が登録できます<br>


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
- has_many:wents


## shops

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| name      | string     | null:false                    |
| text      | text       | null:false                    |
| address   | string     | null:false                    | 
| latitude  | float      | null:false                    | 
| longitude | float      | null:false                    | 
| category  | references | null: false, foreign_key: true |

### Association
- has_many:goods
- has_many:wents
- has_many:menus
- has_many:reviews
- belongs_to: category


## categories

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| name      | string     | null:false                    |

### Association
- has_many:shops


## goods テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| shop     | references | null: false, foreign_key: true |
### Association
- belongs_to: user
- belongs_to: shop


## wents テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| shop     | references | null: false, foreign_key: true |
### Association
- belongs_to: user
- belongs_to: shop


## reviews テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null:false                     |
| text     | text       | null:false                     |
| rate     | float      | null:false                     |
| user     | references | null: false, foreign_key: true |
| shop     | references | null: false, foreign_key: true |

### Association
- belongs_to: shop
- belongs_to: user


## menus テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null:false                     |
| price    | integer    | null:false                     |
| shop     | references | null: false, foreign_key: true |

### Association
- belongs_to: shop
