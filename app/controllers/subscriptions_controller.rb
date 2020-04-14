class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @perk = Perk.find(params[:perk])
  end

  def create
    @perk = Perk.find(params[:perk])
    key = @perk.user.access_code
    # key = current_user.access_code
    Stripe.api_key = key
    # シークレットキー設定

    plan_id = params[:plan]
    plan = Stripe::Plan.retrieve(plan_id)
    token = params[:stripeToken]

    customer  = if current_user.stripe_id?
                 Stripe::Customer.retrieve(current_user.stripe_id)
                else
                 Stripe::Customer.create(email: current_user.email, source:token)
                end
    subscription = Stripe::Subscription.create({
      customer: customer,
      items: [
        {
          plan: plan
        },
      ],
      expand: ["latest_invoice.payment_intent"],
      application_fee_percent: 10,
    }, stripe_account: @perk.user.uid)
    # @project.user.uidにしないといけない"acct_~~~"

    options = {
      stripe_id: customer.id,
      subscribed: true
    }

    # options.merge!(
    #   card_last4: params[:user][:card_last4],
    #   card_exp_month: params[:user][:card_exp_month],
    #   card_exp_year: params[:user][:card_exp_year],
    #   card_type: params[:user][:card_brand]
    # )

    current_user.perk_subscriptions << plan_id
    # ユーザーの定期課金数をupdateしている
    # 配列型を作成できないので中間テーブルを使う？

    current_user.update(options)

    project_updates = {
      backings_count: @perk.backings_count.next,
      current_donation_amount: @perk.current_donation_amount + (plan.amount/100).to_i,
    }

    @project.update(project_updates)

    redirect_to root_path, notice: "Your suscription was setup successfully!"

  end
  
  def destroy
    subscription_to_remove = params[:id]
    plan_to_remove = params[:plan_id]
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(subscription_to_remove).delete
    current_user.subscribed = false
    current_user.perk_subscriptions.delete(plan_to_remove)
    current_user.save
    redirect_to root_path, notice: "Your subscription has been cancelled"
  end
end
