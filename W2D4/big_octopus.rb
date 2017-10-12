fishies = [
  'fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'
        ]

def sluggish_octopus(fishies)
  fishies.each_with_index do |fish, idx|
    biggest_fish = true
    fishies.each_with_index do |fish2, idx2|
      next if idx == idx2
      biggest_fish = false if fish2.length > fish.length
    end
    return fish if biggest_fish
  end
end

  def merge_sort(fishies)
    return fishies if fishies.length <= 1
    midpoint = fishies.length / 2
    left_sort = merge_sort(fishies.take(midpoint))
    right_sort = merge_sort(fishies.drop(midpoint))
    merge(left_sort, right_sort)
  end

  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      case left.first.length <=> right.first.length
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end


def dominant_octopus(fishies)
  merge_sort(fishies)[-1]
end
 # p dominant_octopus(fishies)

def clever_octopus(fishies)
  biggest_fish = fishies.first
  fishies.each do |fish|
    biggest_fish = fish if fish.length > biggest_fish.length
  end
  biggest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_index do |idx|
    return idx if tiles_array[idx] == direction
  end
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
# p fast_dance("right-down", tiles_hash)
# p fast_dance("up", tiles_hash)
