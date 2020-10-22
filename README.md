[![Image from Gyazo](https://i.gyazo.com/4159a16bc80d09c31fd1ac2152b30420.png)](https://gyazo.com/4159a16bc80d09c31fd1ac2152b30420)


## 概要
前職の営業で、使用していたツールやこんな機能があったら仕事効率UPするかもしれないと思ったことを考え、
仕事や活動内容の見える化、情報管理やコミュニケーションツールとしてアプリケーションの開発に取り組みました。

## 本番環境
### App URL
https://work-log-28723.herokuapp.com/
### ID/Pass
  ID: avtive<br>
  Pass: hope2021
### テスト用アカウント等
メールアドレス: appleao@sample.com<br>
パスワード:    apple1234


## 制作背景（意図）
前職では、人の入れ替わりが激しく、実際に仕事するにあたり3つのことが気になりました。<br>
1. 利用しているクラウドサービスでは、1人1アカウントの登録にはコストがかかり、メンバー全員のアカウントを持つことが難しい。
管理者がいないと設定ができない<br>
2. 顧客や依頼情報の管理にバラつきがあり、過去の情報や活動を個人のパソコンやキャビネットで管理をしていたので、<br>
本題に取り掛かる前に過去の情報を探したり調べることに時間がかかってしまうこと<br>
3. 営業以外に会社や採用などの取り組みがあり、メールや電話などで伝達することで、過去情報がなかったり、チームメンバーの共有の漏れが生じること<br>

これらを解決するために、情報管理や業務報告、社員同士が連絡できる機能について考えました。<br>
1. アカウント登録が個人でできる<br>
2. 簡単に投稿、閲覧ができる<br>
3. 決まった投稿場所にコメント、確認で相手の反応が確認できること<br>

これらを主軸に置いて機能の実装に取り掛かりました。<br>

## 実装機能
IDとパスワードを知っている特定の人しか閲覧できないように設定をしています。

### ユーザー管理機能
一人一人が新規登録、ログイン、ログアウト、アカウント編集ができるように設定しています。

[![Image from Gyazo](https://i.gyazo.com/237900a698a1ffbabfd12563aec67a30.png)](https://gyazo.com/237900a698a1ffbabfd12563aec67a30)

担当部署を選択でき、また自己紹介ができる趣味や自由欄、画像を投稿できます。
こちらで登録した情報は、アカウント修正でき、また画像はプレビュー機能を用いて登録する画像確認ができます。

[![Image from Gyazo](https://i.gyazo.com/74b0992e61cbf74974b5c42f5d998810.png)](https://gyazo.com/74b0992e61cbf74974b5c42f5d998810)

登録したユーザーは一覧で表示され、他の方のプロフィールを閲覧可能です。<br>
今後は、個人にメッセージを投稿できる工夫をしていきます。

[![Image from Gyazo](https://i.gyazo.com/cb558b5b8a3d4c79585590a29da5149c.png)](https://gyazo.com/cb558b5b8a3d4c79585590a29da5149c)

### 投稿機能 （新規作成・一覧表示・詳細表示・削除）
投稿したい情報の管理や提出物・掲示板として記事が投稿、一覧表示できるように設定しています。<br>
日報で1日1日顧客情報を書くのではなく、顧客ごとに情報をまとめ、他の営業や作業の方から意見をもらえたり情報交換ができるようと<br>
案件がスムーズに進むことができます。

[![Image from Gyazo](https://i.gyazo.com/ec4bd9ba10c095c8e119cda2f4310423.png)](https://gyazo.com/ec4bd9ba10c095c8e119cda2f4310423)

### タグ・検索機能
投稿にタグをつけることができます。<br>
タグをつけることで、関連した投稿を閲覧できるように設定しています。<br>
今は、登録したタグでしか検索ができないのですが、今後はユーザーや日にちなど検索を工夫していきます。

[![Image from Gyazo](https://i.gyazo.com/a5023e3bd05d207b845a15c734cb81f8.png)](https://gyazo.com/a5023e3bd05d207b845a15c734cb81f8)

### コメント機能と確認機能
投稿した記事の詳細表示では、コメント機能と確認機能の実装を行いました。<br>
投稿した内容についての意見や報告のコメントができ、<br>
確認機能では、何人の人が確認したか、それは誰かを表示できるようになりました。<br>

[![Image from Gyazo](https://i.gyazo.com/22e569bfc50002e8ea71b1003155530e.png)](https://gyazo.com/22e569bfc50002e8ea71b1003155530e)

## 実装予定
### マイページ機能
プロフィールで個人にメッセージを送れるように機能を追加していきます。
### SNS連携機能
メールアドレスやパスワードの入力を省けるようにSNS連携機能
ローカル環境では設定できていますが、本番環境ではエラーが起きてしまうので、こちらの設定の見直しを予定しています。

全体的にデザインや検索など、よりユーザーが利用しやすいように工夫をしていきます。


# ER図

[![Image from Gyazo](https://i.gyazo.com/7f336df8094738cdc0c2954e94b809b7.png)](https://gyazo.com/7f336df8094738cdc0c2954e94b809b7)

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
| department_id    | integer  | null: false |
| birthday         | date     | null: false |
| prefecture_id    | integer  | null: false |
| hobby            | integer  |             |
| free             | text     |             |
| image            | string   |             |

### Association
- has_many :documents
- has_many :comments
- has_many :sns_credentials
- has_one :mark


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
- has_one :mark
- has_many :marked_users, through: :marks, source: :user
- has_many :document_tag_relations, dependent: :destroy
- has_many :tags, through: :document_tag_relations

## commentsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| text         | text       | null: false                   |
| user         | references | foreign_key :true             |
| document     | references | foreign_key :true             |

### Association
- belongs_to :user
- belongs_to :document

### Mark
| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| user         | references | foreign_key :true             |
| document     | references | foreign_key :true             |

- belongs_to :user
- belongs_to :document

## Tagsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| name         | string     | null: false                   |

### Association
- has_many :document_tag_relations, dependent: :destroy
- has_many :documents, through: :document_tag_relations

### DocumentTagRelation

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| tag          | references | foreign_key :true             |
| document     | references | foreign_key :true             |

### Association
- belongs_to :document
- belongs_to :tag

## sns_credentialsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| provider     | string     |                               |
| uid          | string     |                               |
| user         | references | foreign_key :true             |

### Association
- belongs_to :user
