# IT教材レビューサイト STMAFE
# サイト概要
<h3>サイトURL</h3>
https://stmafe.com

<h3>サイトテーマ</h3>
ITに特化した書籍を評価できるレビューサイト

<h3>テーマを選んだ理由</h3>
スクールの学習を進める中でIT書籍を購入する機会がありました。その際、通販サイトには多くのレビューがあり、知りたい情報を探すのに時間がかかりました。また、「初心者向けなのか」「どのような人におすすめなのか」といった情報を把握しづらいと感じました。この経験から、IT書籍に特化したレビューサイトがあれば、学習者が自分に合った書籍を見つけやすくなると考え、このテーマを選びました。


<h3>ターゲットユーザ:</h3>
・自分にマッチした書籍を探したい方

・手頃にIT書籍の評判を知りたい方

<h3>主な利用シーン</h3>
・書籍の購入検討をしてるが慎重に判断したい時

・自分のレベルにあった教材を探したい時


# 設計書
[画面遷移図](https://app.diagrams.net/#G1kB0PGSfRaOSCVljpax_Gj6mWpS4inZbX#%7B%22pageId%22%3A%22upPLcbGFCaysECu4ctlV%22%7D)


[ER図](https://app.diagrams.net/#G1pLdf09GwTvLooNc35InwwDaNA9Ntfr7o#%7B%22pageId%22%3A%22LkA-50vI9zVlM_wPANrl%22%7D)

[テーブル定義書](https://docs.google.com/spreadsheets/d/1xwKfUyd-8MxIYNrFggFyUl5a4Zxj1hgdWMRXKqNmMn4/edit?gid=833448336#gid=833448336)

[アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/12VKfdA2yNKB92dhMezkrAbIiiosV8VHhdPddnOazCII/edit?gid=549108681#gid=549108681)

[AWS 構成図](https://app.diagrams.net/#G1dmyMx-GdtoUVwwNWfhCU4mTDKKWXa4iG#%7B%22pageId%22%3A%22QOMOe_aj81AxLfv5wJow%22%7D)

[AWS インフラ設計書](https://docs.google.com/spreadsheets/d/1VrktxvatcN7btT-vTsK4MuKu35oQu86ORj9EcralRE8/edit?gid=0#gid=0)


# 開発環境
#### 言語
- HTML
- CSS
- JavaScript
- Ruby
- SQL

#### フレームワーク
- Ruby on Rails 8.1.3

#### CSSフレームワーク
- Bootstrap 5.3.0

#### JSライブラリ
 - jQuery
 - Turbo(Hotwire Turbo)
 - importmap-rails

#### データベース
 - SQLite(開発環境)
 - MySQL(本番環境)/ AWS RDS

#### サーバー
- nginx(Webサーバー)
- puma(Applicationサーバー)

#### AWSサービス
- VPC
- ALB
- Route 53
- S3
- EC2
- RDS
- ACM
- Cloudwatch
- IAM

#### IDE
- Visual studio code

##### その他
- Fontawesome 7.3.1
- お名前.com(ドメイン取得)

# 機能一覧
#### ユーザー側
1.新規会員登録/ログイン機能(authentication)

2.レビュー機能
- コメント機能
- 5段階評価機能(raty)

3.お気に入り機能(Ajax)

4.フォロー機能(Ajax)

5.検索/ソート機能(ransack)

6.教材リクエスト機能

7.通知機能

#### 管理者側
1.ログイン機能(authentication)
 - ログイン画面(https://stmafe.com/admin/sign_in)

2.各登録機能
 - 教材登録
 - タグ登録
 - カテゴリ登録

3.各管理機能
 - 教材管理
 - レビュー管理
 - ユーザ管理
 - リクエスト管理

4.検索/並び替え機能(ransack)


# 使用素材
・ソコスト様 リンク先：https://soco-st.com/

・IlustAC様 リンク先：https://www.ac-illust.com/