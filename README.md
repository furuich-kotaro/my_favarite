## Myfavorite_pleace

ツイッター風の画像＋自分の好きな場所の位置情報を投稿するアプリです
<img width="1453" alt="スクリーンショット 2019-12-15 23 47 29" src="https://user-images.githubusercontent.com/54981611/70864463-68610b80-1f95-11ea-9b7f-d808e4efc958.png">
<img width="800" alt="スクリーンショット 2019-12-12 15 32 53" src="https://user-images.githubusercontent.com/54981611/70688482-42b5d700-1cf5-11ea-9edc-8006db0e236b.png">
<img width="800" alt="スクリーンショット 2019-12-12 15 33 10" src="https://user-images.githubusercontent.com/54981611/70688488-45b0c780-1cf5-11ea-99c0-d2a6c9605976.png">

## URL

https://myfavariteplace.work

- ログイン、新規登録ページの簡単ログインでテストユーザとしてログインできます
- テストユーザの情報編集は禁止しています。ご了承ください
- 初期登録されているユーザのパスワードはすべて" password "です。

## 使用技術

#### アーキテクチャ図

<img width="800" alt="スクリーンショット 2019-12-12 15 33 10" src="https://user-images.githubusercontent.com/54981611/70692538-e0fa6a80-1cfe-11ea-80b7-ddb9164aa93f.png">

#### バックエンド

- Ruby 2.6.0
- Rails 5.2.3
- Docker
- Nginx
- Rspec
- CircleCI
- Capistrano
- AWS(EC2, RDS for MySQL, S3, VPC, Route53, ALB, ACM)

#### フロント

- slim
- scss
- bootstarap
- JQuery

## 機能一覧

- CircleCI と Capistrano を用いた CI/CD 機能
- Rspec による自動テスト機能
- ユーザー登録・ログイン機能（devise を使用）
- 投稿機能（画像のアップロードに CarrierWave を使用）
- 位置情報投稿機能(Google Maps API/Geocoding API)
- 投稿一覧・投稿詳細表示機能
- タグ機能(acts-as-taggable-on)
- 投稿管理機能
- ページネーション機能（Kaminari）
- いいね機能
- フォロー機能
- 検索機能（Ransack）
