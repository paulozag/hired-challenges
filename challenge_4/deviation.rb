# require 'pry'



class Deviation_Finder

  attr_accessor :array, :high_ranges

  def initialize arr, d
    @array    = arr
    @length    = arr.length
    @d        = d
    @high_ranges  = []
    @low_ranges   = []
  end



  def solve
    populate_high_array
    # above method populates :high_ranges - this is an array whose values represent the highest value up to d elements away
    differential_array = []
    high_ranges.each_with_index do |v,i|
      differential_array << v-@array[i]
      # this differential array now represents the difference between the highest value this index could be to the current value.  the max value in this array
      # will represent the greatest deviation in a d length list of elements of the initial array
    end
    differential_array.max
  end

  def populate_high_array
    high_slice 0, @length - 1
  end

  def high_slice i_start, i_end
    max_index = @array[i_start..i_end].each_with_index.max[1]
    max_value = @array[max_index + i_start]
    push_values max_index + i_start, max_value, @high_ranges

    unless (max_index + @d + i_start) >= i_end
      (high_slice max_index + i_start + 1,i_end)
    end

    unless (max_index - @d ) <= 0
      (high_slice i_start, max_index + i_start - 1)
    end
  end



  def push_values index, value, array
    start = [0, (index - @d)].max
    finish = [(@length - 1), index + @d].min
    (start..finish).to_a.each { |i| array[i] ||= value }
  end

end

test_array = []
100000.times do
  test_array << rand(0..100000000000)
end
test_d = rand(2...100000)

a = Deviation_Finder.new(test_array, test_d)

p a.solve