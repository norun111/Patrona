module PerksHelper
  def author_of(resource)
    user_signed_in? && resource.creator_id == current_user.creator.id
  end

  def admin?
    user_signed_in? && current_user.admin?
  end

  def can_receive_payment?
    uid && provider? && access_code? &&  publishable_key?
  end

  def purchased_perk(perk)
    user_signed_in? && current_user.perk_subscriptions.include?("#{perk.title.parameterize}-perk_
    #{perk.id}")
  end
end
