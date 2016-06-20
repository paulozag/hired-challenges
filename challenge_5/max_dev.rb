require 'pry'

def generate_test_array
  array = []
  1000000.times do
    array << (rand(2000) - 1000)
  end
  array
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


  low_index = bounds.each_with_index.min[1]
  low_span_beg = index_of_low_span_beg bounds, low_index
  high_span_end = index_of_high_span_end bounds, low_index
  left_side_sum =  array[low_span_beg..low_index].inject(:+)
  right_side_sum = array[(low_index+1)..high_span_end].inject(:+)
  p right_side_sum - left_side_sum
end

def index_of_low_span_beg bounds, low_index
  result = bounds[0..low_index].each_with_index.max[1]
  bounds[result] < 0 ? 0 : result + 1
end

def index_of_high_span_end bounds, low_index
  end_index = bounds.length - 1
  return end_index if low_index == end_index
  result = bounds[(low_index+1)..-1].each_with_index.max[1] + low_index
  (result == end_index && bounds[-1] > bounds[-2]) ? result : result + 1
end

find_max_dev generate_test_array