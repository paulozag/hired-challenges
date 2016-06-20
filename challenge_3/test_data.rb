def perfect_spread? array,spread
  if spread == 0
    return big_enough_spread? array, spread
  end
  # spread will work but spread- 1 won't
  if (big_enough_spread?(array,spread)) && (big_enough_spread?(array,spread-1))
    p "overshot the spread"
  end
  (big_enough_spread?(array,spread)) && !(big_enough_spread?(array,spread-1))
end

def big_enough_spread? array,spread
  arr = array.dup
  arr[0] -= spread
  index = 1
  while index < arr.length
    return false if (arr[index] + spread) <= arr[index-1]
    arr[index] = [(arr[index - 1] + 1), arr[index] - spread].max
    index += 1
  end
  true
end

def perform_test
  50.times do
    random_array = []
    5000.times do
      random_array << rand(99999999999)
    end
    spread = hill random_array
    unless perfect_spread? random_array, spread
      p '*' * 80
      p why_failed random_array, spread
      p "first_last_length_spread: #{first_last_length_spread random_array}"
      p "largest_one_gap_spread: #{largest_one_gap_spread random_array}"
      p "highest_to_low_spread: #{highest_to_low_spread random_array}"
      p "high_to_lowest_spread: #{high_to_lowest_spread random_array}"
      p "exp spread: #{exp random_array}"
      p random_array.to_s
      p '*' * 80
      p
      p
    end
    p spread
  end
end
