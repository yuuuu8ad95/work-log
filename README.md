[![Image from Gyazo](https://i.gyazo.com/4159a16bc80d09c31fd1ac2152b30420.png)](https://gyazo.com/4159a16bc80d09c31fd1ac2152b30420)


## 概要
仕事や活動内容の見える化、情報管理やコミュニケーションツールとしてのアプリケーション

## 本番環境
### App URL
https://work-log-28723.herokuapp.com/
### ID/Pass
  ID: avtive
  Pass: hope2021
### テスト用アカウント等
メールアドレス: appleao@sample.com
パスワード:    apple1234


## 制作背景（意図）
クラウドサービスでは1人1アカウントの登録にはコストがかかり、メンバー全員のアカウントを持つことが難しいことがあります。
また、過去の情報や活動を個人のパソコンやキャビネットで管理をしたり、メールや電話などで伝達することで、情報の抜け漏れが生じることがあります。
効率的に仕事や活動ができるアプリケーションの作成に取り組みました。


## 実装機能
### ユーザー管理機能

新規登録、ログイン、ログアウト、アカウント編集ができるように設定しています。

[![Image from Gyazo](https://i.gyazo.com/237900a698a1ffbabfd12563aec67a30.png)](https://gyazo.com/237900a698a1ffbabfd12563aec67a30)
担当部署を選択でき、また自己紹介ができる趣味や自由欄、画像を投稿できるように設定しています。
こちらで登録した情報は、今後の実装予定で閲覧できるようにします。

### 投稿機能 （新規作成・一覧表示・詳細表示・編集・削除）
記録したい情報の管理や提出物・掲示板として記事が投稿、一覧表示できるように設定しています。

[![Image from Gyazo](https://i.gyazo.com/6e9ce05fc6b8c77afd5a5fc7034cc5ef.jpg)](https://gyazo.com/6e9ce05fc6b8c77afd5a5fc7034cc5ef)

### コメント機能
[![Image from Gyazo](https://i.gyazo.com/435da6a7c5e9e047b73d3bfe77089d03.png)](https://gyazo.com/435da6a7c5e9e047b73d3bfe77089d03)

投稿した記事の詳細表示では、コメントができるように設定しています。
「いいね」などのリアクション機能の設定も予定しています。

## 実装予定
### SNS連携機能
ローカル環境では設定できていますが、本番環境ではエラーが起きてしまうので、こちらの設定の見直しを予定しています。

### マイページ機能
ユーザー管理機能の追加機能として自己紹介ができるようなページを作成予定です。

### タグ付き・検索機能
投稿内容を連絡、日報、イベントなど、タグをつけることで振り分けるように設定し
検索機能ができるように予定にしています。



# ER図

[![Image from Gyazo](https://i.gyazo.com/24938f78cf4476e5dd0fea30b2ced212.png)](https://gyazo.com/24938f78cf4476e5dd0fea30b2ced212)

# DB設計


## usersテーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| first_name       | string   | null: false |
| family_name      | string   | null: false |
| first_name_kana  | string   | null: false |
| family_name_kana | string   | null: false |
| department       | integer  | null: false |
| birthday         | date     | null: false |
| prefecture       | integer  | null: false |
| hobby            | integer  |             |
| free             | text     |             |
| images           | string   |             |

### Association
- has_many :documents
- has_many :messages
- has_many :sns_credentials


## documentsテーブル
 
| Column        | Type       | Options                  |
| ------------- | ---------- | ------------------------ |
| title         | string     | null: false              |
| content       | text       | null: false              |
| date          | date       | null: false              |
| deadline      | date       | null: false              |
| user          | references | foreign_key :true        |


### Association
- belongs_to :user
- has_many :comments


## commentsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| text         | text       | null: false                   |
| user         | references | foreign_key :true             |
| document     | references | foreign_key :true             |

### Association
- belongs_to :user
- belongs_to :document


## sns_credentialsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| provider     | string     |                               |
| uid          | string     |                               |
| user         | references | foreign_key :true             |

### Association
- belongs_to :user
