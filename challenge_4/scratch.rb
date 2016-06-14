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
    # populate_high_array
    # populate_low_array
  end

  def high_slice i_start, i_end
    max_index = @array[i_start..i_end].each_with_index.max[1]
    max_value = @array[max_index]
    push_values max_index, max_value, @high_ranges
    (high_slice @array[(max_index + 1)..i_end]) unless max_index + @d > i_end
    (high_slice @array[i_start...(max_index)]) unless max_index - @d < i_start
  end

  def low_slice i_start, i_end
    min_index = @array[i_start..i_end].each_with_index.min[1]
    min_value = @array[min_index]
    push_values min_index, min_value, @low_ranges
  end

  def push_values index, value, array
    start = [0, (index - @d)].max
    finish = [(@length - 1), index + @d].min
    (start..finish).to_a.each { |i| array[i] ||= value; p i }
  end

end

data = [1,5,3,9,12,3,2,0,6]

a = Deviation_Finder.new(data, 2)

p a.array
a.push_values 4, 12, a.high_ranges
p a.array
p a.high_ranges