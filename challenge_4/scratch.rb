require 'pry'

array = [6,9,4,7,4,1]
d_len = 3

#  to begin, write an algorithm to map the indices for the ranges of +/- d by highest value.

# test data
test_array = []
200.times do
  test_array << rand(0..10000)
end

class Deviation_Finder

  attr_accessor :array, :high_ranges, :low_ranges
  def initialize arr, d
    @array    = arr
    @length    = arr.length
    @d        = d
    @high_ranges  = []
    @low_ranges   = []
  end



  def solve
    populate_high_array
    # populate_low_array
    differential_array = []
    high_ranges.each_with_index {|v,i|
      differential_array << v-@array[i]}
    differential_array.max
  end

  def populate_high_array
    high_slice 0, @length - 1
  end

  def high_slice i_start, i_end
    max_index = @array[i_start..i_end].each_with_index.max[1]
    max_value = @array[max_index + i_start]
    push_values max_index + i_start, max_value, @high_ranges
    # binding.pry
    (high_slice max_index + i_start + 1,i_end) unless (max_index + @d + i_start) >= i_end
    (high_slice i_start, max_index + i_start - 1) unless (max_index - @d + i_start) <= i_start
  end

  def low_slice i_start, i_end
    min_index = @array[i_start..i_end].each_with_index.min[1]
    min_value = @array[min_index]
    push_values min_index, min_value, @low_ranges
  end

  def push_values index, value, array
    start = [0, (index - @d)].max
    finish = [(@length - 1), index + @d].min
    (start..finish).to_a.each { |i| array[i] ||= value }
  end

end

data = [1,5,3,9,12,3,2,0,6]

a = Deviation_Finder.new(array, d_len)

# p a.array
# a.solve
# p a.array
# p a.high_ranges

p a.solve