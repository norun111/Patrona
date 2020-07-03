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
# Patrona
<img width="823" alt="スクリーンショット 2020-05-05 16 35 23" src="https://user-images.githubusercontent.com/57556499/86472438-22756480-bd7a-11ea-937b-4da4958f26a3.PNG">
#
<img width="821" alt="スクリーンショット 2020-05-05 16 35 36" src="https://user-images.githubusercontent.com/57556499/86472853-cc54f100-bd7a-11ea-90f4-fb9c325fbaae.PNG">


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

## Contents

|Column|Type|Options|
|------|----|-------|
|image|string|default: ""|
|image_title|string|default: ""|
|image_description|text||
|video|string||
|video_url|string||
|thumbnail|string||
|video_title|string||
|video_description|text||
|audio|string||
|audio_image|string||
|audio_title|string||
|audio_description|text||
|creator_id|bigint||
|created_at|datetime|null: false|
|update_at|datetime|null: false|

### Association

- belongs_to :creator
- has_many :comments, foreign_key: :content_id, dependent: :destroy
- has_many :content_perks, dependent: :destroy
- has_many :perks, through: :content_perks
- accepts_nested_attributes_for :content_perks

## Perks

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|amount|decimal|precision: 8, default: "0", null: false|
|description|text||
|image|string||
|creator_id|bigint|null: false|
|user_id|bigint|null: false|
|created_at|datetime|null: false|
|update_at|datetime|null: false|
|current_donational_amount|integer|default: 0|
|status|string|default: "active"|
|backings_count|integer|default: 0|

### Association
- belongs_to :creator
- belongs_to :user
- has_many :content_perks, dependent: :destroy
- has_many :contents, through: :content_perks


## Content_Perks

|Column|Type|Options|
|------|----|-------|
|content_id|bigint||
|perk_id|bigint||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :content
- belongs_to :perk

## Rooms
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|index: true|
|creator_id|bigint|index: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
- belongs_to :creator
- has_many :messages

## Message
|Column|Type|Options|
|------|----|-------|
|room_id|bigint|index: true|
|user_id|bigint|index: true|
|creator_id|bigint|index: true|
|is_user|boolean||
|content|text||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :room, optional: true
- belongs_to :user, optional: true
- belongs_to :creator, optional: true

## Comments
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|bigint|index: true|
|creator_id|bigint|index: true|
|creator_name|string||
|content_id|bigint|index: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
- belongs_to :creator
- belongs_to :content
