# Work-log


## 概要
仕事や活動内容の見える化、情報管理やコミュニケーションツールとしてのアプリケーション

##制作背景（意図）
クラウドサービスでは1人1アカウントの登録にはコストがかかり、メンバー全員のアカウントを持つことが難しいことがあります。
また、過去の情報や活動を個人で管理をしたり、メールや電話などで伝達することで、
仕事情報の管理や伝え漏れをなくし、効率的に仕事や活動ができるアプリケーションの作成に取り組みました。


### 実装機能
ユーザー管理機能
新規登録、ログイン、ログアウト、アカウント編集ができるように設定しました。

投稿機能（新規作成・一覧表示・詳細表示）
記録したい情報の管理や提出物、掲示板として記事が投稿できるように設定しました。

### 実装予定
マイページ機能
ユーザー管理機能の追加機能として自己紹介ができるようなページを作成予定です。

投稿機能（編集、削除、タグ付き）
投稿内容の編集や削除ができる機能を追加します。
また、投稿内容を連絡、日報、イベントなど、タグをつけることで振り分けるように設定する予定です。

コメント機能
投稿内容について、質問やアドバイスができるようにします。

SNS連携機能
メールアドレス、パスワードを新しく設定しなくても、googleやFacebookのアカウントを持っている人は、
そのまま利用できるようにします。



# DB計


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
| item         | references | foreign_key :true             |

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
