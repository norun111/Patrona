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

## User

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, index: true, unique: true|
|encrypted_password|string|null: false|
|reset_password_token|string|index: true, unique: true|
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|image|string|null: true|
|uid|string|
|provider|string|
|access_code|string|
|publishable_key|string|
|stripe_id|string|
|stripe_subscription_id|string||
|subscribed|boolean||
|card_last4|string||
|card_exp_month|string||
|card_exp_year|string||
|card_type|string||
|perk_subscriptions|text||
|description|text||


### Association

- has_one :creator
- has_many :comments, dependent: :destroy
- has_many :perks, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :rooms
- has_many :messages