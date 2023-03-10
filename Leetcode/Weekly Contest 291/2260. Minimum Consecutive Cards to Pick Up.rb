
# @param {Integer[]} cards
# @return {Integer}
def minimum_card_pickup(cards)
  occurrences = []
  m = {}
  min_sub = [0,1000100]
  last_index = {}
  cards.each.with_index do |x,i|
    if last_index[x] == nil
      last_index[x] = i
    else
      if min_sub[1] - min_sub[0] > i - last_index[x]
        min_sub = [last_index[x],i]
      end
    end
    last_index[x] = i
  end

  if min_sub[1] == 1000100
    return -1
  end
  cards[min_sub[0]..min_sub[1]].length
end

cards = [0,0]
puts minimum_card_pickup(cards)
