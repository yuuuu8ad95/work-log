# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計


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
| birthday         | date     | null: false |
| prefecture       | integer  | null: false |
| hobby            | integer  |             |
| free             | text     |             |
| images           | string   | null: false |

### Association
- has_many :documents
- has_many :messages
- has_many :sns_credentials


## documentsテーブル
 
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| data                | string     | null: false                   |
| title               | string     | null: false                   |
| day                 | string     | null: false                   |
| content             | text       | null: false                   |

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
