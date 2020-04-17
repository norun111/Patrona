module ContentsHelper

  def set_creator_perks(creator)
    creator.perks
  end

  # クリエイターが持っているPerkのIDsとContentが持っているperk_idsの比較
  def change_array(content)
    hoge = content.perk_ids
    hoge_a = hoge.split(',').map { |m| m.delete('[]"\\\\')}

    map = hoge_a.map!(&:to_i)

    @creator = Creator.find(11)
    perk_array = @creator.perks.ids

    dup =  map.push(perk_array)
    dup2 = dup.flatten
    pef = dup2.group_by{ |e| e }.select { |k, v| v.size > 1 }.map(&:first)
  end

  def duplicate_values
    max = self.size
    self.reverse_each.with_index do |e,i|
      break if i == max-1 # N-1回比較
      @dup_values = @dup_values ?  @dup_values & self[i] : self[i] & e
    end
    @dup_values
  end
end
