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

  def count_patrons(creator)
    sum = 0
    creator.perks.each do |perk|
      puts sum += perk.backings_count 
    end
  end

end
