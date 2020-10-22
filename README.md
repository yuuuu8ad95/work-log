[![Image from Gyazo](https://i.gyazo.com/4159a16bc80d09c31fd1ac2152b30420.png)](https://gyazo.com/4159a16bc80d09c31fd1ac2152b30420)


## 概要
前職の営業でこんな機能があったら仕事効率UPするかもしれないと考え、
仕事や活動内容の見える化、情報管理やコミュニケーションツールを用いたアプリケーションの開発に取り組みました。

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
前職では、人の入れ替わりが激しく、実際に仕事するにあたり3つのことが気になりました。
①顧客や依頼情報の管理にバラつきがあり、過去の情報や活動を個人のパソコンやキャビネットで管理をしていたので、本題に取り掛かる前に過去の情報を探したり調べることに時間がかかってしまうこと
②利用しているクラウドサービスでは、1人1アカウントの登録にはコストがかかり、メンバー全員のアカウントを持つことが難しい。管理者がいないと設定ができない
③営業以外に会社や採用などの取り組みがあり、メールや電話などで伝達することで、過去情報がなかったり、チームメンバーの共有の漏れが生じること

これらを解決するために、情報管理や業務報告、社員同士が連絡できる機能について考えました。

## 実装機能
IDとパスワードを知っている特定の人しか閲覧できないように設定をしています。

### ユーザー管理機能
一人一人が新規登録、ログイン、ログアウト、アカウント編集ができるように設定しています。

[![Image from Gyazo](https://i.gyazo.com/237900a698a1ffbabfd12563aec67a30.png)](https://gyazo.com/237900a698a1ffbabfd12563aec67a30)
担当部署を選択でき、また自己紹介ができる趣味や自由欄、画像を投稿できるように設定しています。
こちらで登録した情報は、アカウント修正することができます。
[![Image from Gyazo](https://i.gyazo.com/c8aaa12c0a4677596114e353a45b8cd7.png)](https://gyazo.com/c8aaa12c0a4677596114e353a45b8cd7)
ユーザー一覧で他の方のプロフィールを閲覧可能です。今後は、個人にメッセージを投稿できる工夫をしていきます。
[![Image from Gyazo](https://i.gyazo.com/89ab9d1dc6520893e93fbb00fa9ecb03.jpg)](https://gyazo.com/89ab9d1dc6520893e93fbb00fa9ecb03)

### 投稿機能 （新規作成・一覧表示・詳細表示・編集・削除）
記録したい情報の管理や提出物・掲示板として記事が投稿、一覧表示できるように設定しています。


[![Image from Gyazo](https://i.gyazo.com/aa58e5839d11d783fbe3cb2cd199891a.jpg)](https://gyazo.com/aa58e5839d11d783fbe3cb2cd199891a)


### コメント機能と確認機能
[![Image from Gyazo](https://i.gyazo.com/15a57ffea3483b5e82f08fc7d823ed97.png)](https://gyazo.com/15a57ffea3483b5e82f08fc7d823ed97)

投稿した記事の詳細表示では、コメント機能と確認の機能の実装を行いました。
コメント機能をすることで、投稿した内容についての意見や連絡ができ、
確認機能では、何人の人が確認したか、それは誰かを表示できるように設定しました。

## 実装予定
### SNS連携機能
メールアドレスやパスワードの入力を省けるようにSNS連携機能
ローカル環境では設定できていますが、本番環境ではエラーが起きてしまうので、こちらの設定の見直しを予定しています。

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



## sns_credentialsテーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------- |
| provider     | string     |                               |
| uid          | string     |                               |
| user         | references | foreign_key :true             |

### Association
- belongs_to :user
