module CreatorsHelper

  def podcasts_check(creator)
    creator.podcasts.present?
  end

  def videos_check(creator)
    creator.videos.present?
  end

  def music_check(creator)
    creator.music.present?
  end

  # backings_countの合計値
  def count_patrons(creator)
    count_arry = []

    creator.perks.each do |perk|
      count_arry << perk.backings_count 
    end
    count_arry.sum
  end

  def count_current_donational_amount(creator)
    donate_arry = []

    creator.perks.each do |perk|
      donate_arry << perk.current_donational_amount
    end

    donate_arry.sum
  end

  def purchased_perk(perk)
    user_signed_in? && current_user.perk_subscriptions.include?("#{perk.title.parameterize}-perk_
    #{perk.id}")
  end
end
