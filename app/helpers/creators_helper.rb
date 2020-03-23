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

end
