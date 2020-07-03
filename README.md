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

## Users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, index: true, unique: true|
|encrypted_password|string|null: false|
|reset_password_token|string|index: true, unique: true|
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|created_at|datetime|null: false|
|update_at|datetime|null: false|
|image|string|null: true|
|uid|string|null: true|
|provider|string|null: true|
|access_code|string|null: true|
|publishable_key|string|null: true|
|stripe_id|string|null: true|
|stripe_subscription_id|string|null: true|
|subscribed|boolean|null: true|
|card_last4|string|null: true|
|card_exp_month|string|null: true|
|card_exp_year|string|null: true|
|card_type|string|null: true|
|perk_subscriptions|text|null: true|
|description|text|null: true|


### Association

- has_one :creator
- has_many :comments, dependent: :destroy
- has_many :perks, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy
- has_many :rooms
- has_many :messages

## Creators

|Column|Type|Options|
|------|----|-------|
|podcasts|boolean|default: false|
|videos|boolean|default: false|
|music|boolean|default: false|
|creator_name|string|default: false|
|creator_email|string|default: false|
|restriction|integer|default: 0|
|user_id|bigint|
|created_at|datetime|null: false|
|update_at|datetime|null: false|
|image|string||
|cover_iamge|string|
|video|string|
|description|text|
|thumbnail|string|
|dm_permission|integer|default: 1|



### Association

- belongs_to :user
- has_many :contents, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :perks, dependent: :destroy
- has_many :rooms
- has_many :messages