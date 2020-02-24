# README

* デレステSS保管庫(仮)  
Railsで作成したデレステのスクリーンショットを投稿する画像投稿サイトです。

* 実装した機能の説明  
・ログイン  
DeviseとTwitterAPIを用いた認証システムで実装しています。

・投稿  
画像を投稿します。画像の保存先はAWS S3へ保存されるようにしています。(Herokuでは画像が一時的にしか保存されないため)

・オートコンプリート  
フォーム入力にオートコンプリート機能を実装しています。

・投稿編集  
投稿内容を編集できます。

・投稿削除  
投稿したユーザーと紐付いた投稿を削除します。

・いいね機能  
JQuery Ajax(非同期通信)で画面リロードさせずに♥の色、いいね数を反映させています。

・タグ機能  
タグ押下でその内容に関連した投稿がフィルターされます。

・検索機能  
検索すると関連した投稿が表示されます。(曖昧検索可)

・バリデーション機能  
投稿フォームにて適切な入力がなされていない場合、エラーを表示させるようにしています。

・ページネーション  
kaminariを用いて実装

* 使い方  
画像投稿するにはログインしてください。

* 使用技術  
Ruby  ...  使用言語  
Ruby on Rails  ...  webフレームワーク  
PostgreSQL  ...  DB  
Bootstrap  ... CSSフレームワーク  
Git  ...  バージョン管理  
S3  ...  クラウド上に画像保存  
Heroku  ...  サーバ  
Javascript  ...  フロント(非同期通信)

* license  
Copyright (c) 2020 Yusuke Kato
Released under the MIT license


* ...
