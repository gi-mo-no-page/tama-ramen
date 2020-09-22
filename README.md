# Tama-Ramen
多摩地区のラーメン店を検索できます。
近所の気になるお店や知らないお店の情報を検索してお店選びの際に
利用されることを想定しています。
皆さんが後悔のないラーメンライフを送るお手伝いをします。

# アプリケーション概要
- 店名・ジャンル・エリアから各種店舗検索<br>
- 店舗詳細ページから評価と口コミの投稿<br>
- 行った店舗、お気に入り店舗の登録<br>
- シェアしたい店舗の投稿<br>

# URL
 [こちらよりどうぞ](https://tama-ramen.herokuapp.com/)

新規登録またはログイン画面左上部よりゲストアカウントでログインできます。
適宜ご利用ください。

# 目指した課題解決
１日３回という限られた食事回数の中で星の数ほどある食べ物の中から「ラーメン」を選択した際に、可能な限り後悔する確率を減らしたい！！<br>
その思いから開発をしました。多摩地区のどこに、どんな味のラーメンが存在するのかを明確にし、お店選びの一助になることです。

# 洗い出した要件

| 機能             | 目的   | 詳細                  |
| ---------------- | ------  | ------------------------- |
| 検索機能         | 効率よく探す  | 店名、ジャンル、エリアで検索ができる                |
| email            | string  | null:false , unique: true |
| password         | string  | null:false                |





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
- has_many:shops
- has_many:menus


## shops

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| name      | string     | null:false                    |
| text      | text       | null:false                    |
| address   | string     | null:false                    | 
| latitude  | float      | null:false                    | 
| longitude | float      | null:false                    | 
| category  | references | null: false,foreign_key: true |
| user      | references | null: false, foreign_key: true|

### Association
- has_many:goods
- has_many:wents
- has_many:menus
- has_many:reviews
- belongs_to: category
- belongs_to: user


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
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to: shop
- belongs_to: user
