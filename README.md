# cakePHP 3 docker 環境

これは、cakePHP をdocker環境で構築するためのものです。

## 使い方

まずはクローン

```
git clone {このリポジトリ}
```

以下（管理者権限必須）  
ビルド！（docker-compose .yml があるところで）

```bash
sudo docker-compose build
```

実行

```bash
sudo docker-compose up -d
```

docker の状況を確認

```bash
sudo docker ps
```

php_fpm_56 コンテナの中に入る

```bash
sudo docker exec -it php_fpm_56 bash
```

そのあと

```bash
composer.phar create-project --prefer-dist cakephp/app:^3.9 cms
```

* `cms` のところを変えるとプロジェクトのディレクトリが変更可能

## 表示確認
ローカルホストで確認
http://localhost/

これでデフォルトページが見れたら OK

## DB 接続方法

docker-compose で mysql サーバーも建っているかと思うので `/nginx/cms/config/app_local.php` 上のDB 接続情報を上書き

```
    'username' => 'cake',
    'password' => 'cake',
    'database' => 'cake_db',
    'host' => 'mysql',
```
こうすれば、接続できます！

## このシステムのバージョン
PHP Version 5.6.40  
CakePHP 3.9.8 Red Velvet  
mysql: 5.7  
