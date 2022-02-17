# テーブル設計

## usersテーブル

|Column    |Type  |option                   |
|----------|------|-------------------------|
|email     |string|null: false, unique: true|
|encrypted_password  |string|null: false              |
|name      |string|null: false              |
|profile   |text  |null: false              |
|occupation|text  |null: false              |
|position  |text  |null: false              |

## prototypesテーブル

|Column    |Type      |option                        |
|----------|----------|------------------------------|
|title     |string    |null: false                   |
|catch_copy|text      |null: false                   |
|concept   |text      |null: false                   |
|user      |references|null: false, foreign_key: true|

## commentsテーブル

|Column   |Type      |option                        |
|---------|----------|------------------------------|
|content  |text      |null: false, foreign_key: true|
|prototype|references|null: false, foreign_key: true|
|user     |references|null: false, foreign_key: true|