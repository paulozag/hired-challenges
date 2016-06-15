require 'pry'

def generate_test_array
  array = []
  10.times do
    array << (rand(2000) - 1000)
  end
  array
  # [-812, -369, -750, 86, -441, 691, -784, 746, -536, -405]
  [-932, 618, -529, 688, -259, 104, 50, 98, -371, -245]
end

def find_max_dev array
  bounds = []
  array.each_with_index do |val, i|
    if i > 0
      prev_ammt = bounds[i-1]
    else
      prev_ammt = 0
    end
    bounds[i] = val + prev_ammt
  end
  p array

  low_index = bounds.each_with_index.min[1]
  low_span_beg = index_of_low_span_beg bounds, low_index
  high_span_end = index_of_high_span_end bounds, low_index
  p array
  # p "*&*" * 40
  p bounds
  # p low_index
  # p bounds[low_index]
  p "left subsequence: #{array[low_span_beg..low_index]}  right subsequence: #{low_index==(array.length)-1 ? [] : array[(low_index+1)..high_span_end]}"
end

def index_of_low_span_beg bounds, low_index
  binding.pry
  result = bounds[0..low_index].each_with_index.max[1]
  ((result == 0 && bounds[0]) <= 0) ? 0 : result + 1
end

def index_of_high_span_end bounds, low_index
  binding.pry
  return [] if low_index == (bounds.length) -1
  result = bounds[(low_index+1)..-1].each_with_index.max[1]
  last_element_index = bounds.length - 1
  (result == last_element_index && bounds[-1] > bounds[-2]) ? result : result - 1
end

find_max_dev generate_test_array