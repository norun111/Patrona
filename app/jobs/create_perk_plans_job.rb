class CreatePerkPlansJob < ApplicationJob
  queue_as :default

  def perform(perk)
    key = perk.user.access_code
    Stripe.api_key = key
    
    Stripe::Plan.create({
      id: "#{perk.title.parameterize}-perk_#{perk.id}",
      amount: (perk.amount).to_i,
      currency: 'jpy',
      interval: 'month',
      product: {name: perk.title},
      nickname: perk.title.parameterize
    })
  end
end
