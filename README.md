## Tama-Ramen
多摩地区のラーメン店を検索できます。
近所の気になるお店や知らないお店の情報を検索してお店選びの際に
利用されることを想定しています。
皆さんが後悔のないラーメンライフを送るお手伝いをします。

## アプリケーション概要
- 店名・ジャンル・エリアから各種店舗検索<br>
- 店舗詳細ページから評価と口コミの投稿<br>
- 行った店舗、お気に入り店舗の登録<br>
- シェアしたい店舗の投稿<br>
- 使用した技術<br>
HTML・CSS・Ruby・Ruby on Rails・JavaScript<br>
AWS(EC2、S3、Route53)・Docker・CircleCi(CI/CD)

## URL
 [こちらよりどうぞ](http://tama-ramen.com/)

新規登録またはログイン画面左上部よりゲストアカウントでログインできます。
適宜ご利用ください。

## 目指した課題解決
１日３回という限られた食事回数の中で星の数ほどある食べ物の中から「ラーメン」を選択した際に、可能な限り後悔する確率を減らしたい！！
その思いから開発をしました。多摩地区のどこに、どんな味のラーメンが存在するのかを明確にし、お店選びの一助になることです。

## 洗い出した要件

| 機能             | 目的                        | 詳細                                          |
| ---------------- | --------------------------- | --------------------------------------------- |
| 検索機能         | 効率よく探す                | 店名、ジャンル、エリアで検索ができる          |
| 口コミ（評価） | どのような店舗か把握できる  | 評価点数をつけ、誰がどのお店のにコメントしたのかがわかる         |
| お気に入り登録   | 再検索の手間がない          | お気に入り登録ボタンをクリックすると登録できる                 |
| 地図             | 店舗の場所がわかる          | GoogleMapを導入する                |
| 店舗の投稿       | 新しい店舗を投稿できる      | まだ登録されていないお店をシェアできる                 |
| ユーザー管理     | ユーザーの情報の可視化      | マイページにてお気に入り、行った店舗、投稿した店舗の一覧表示         |

## 実装した機能について
- [検索機能](https://gyazo.com/21f810bffae48ebb50a2541b06affaa6)：TOPページ中央と各ページ上部ヘッダーから検索可能です
- [口コミ](https://gyazo.com/f8f3a331188ebe86e038879478e6d6f8)：店舗詳細ページから投稿できます。評価を☆でつけられます。
- [お気に入り登録](https://gyazo.com/fe414d5b94cd097999c96ae7d400dca6)：店舗詳細ページから登録できます。登録した店舗はマイページから閲覧できます。
- [地図](https://gyazo.com/757fca10af92fa4f2e26ed3b1259bcbc)：店舗詳細ページの地図のタブから閲覧できます。<br>
- [ユーザー管理](https://gyazo.com/a2a9b5e1335be392a5b76ef14c1b4d35)：：ユーザー名をクリックするとマイページに遷移します。


## テーブル設計
- [ER図](https://gyazo.com/e495b32f40ff6194b6054be006756310)

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

