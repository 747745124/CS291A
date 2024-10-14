require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class     # An empty array is an instance of Array
    assert_equal 0, empty_array.size          # The size of the empty array is 0
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array                    # Array is created as an empty literal []

    array[0] = 1
    assert_equal [1], array                   # First element set to 1

    array[1] = 2
    assert_equal [1, 2], array                # Second element set to 2

    array << 333
    assert_equal [1, 2, 333], array           # Appending 333 to the array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]            # First element is :peanut
    assert_equal :peanut, array.first         # First element via array.first is :peanut
    assert_equal :jelly, array[3]             # Fourth element is :jelly
    assert_equal :jelly, array.last           # Last element via array.last is :jelly
    assert_equal :jelly, array[-1]            # -1 index gives last element, :jelly
    assert_equal :butter, array[-3]           # -3 index gives the second element, :butter
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]        # Slicing returns 1 element, [:peanut]
    assert_equal [:peanut, :butter], array[0,2] # First 2 elements
    assert_equal [:and, :jelly], array[2,2]   # 2nd slice from index 2, length 2
    assert_equal [:and, :jelly], array[2,20]  # Slice beyond the length, bounded slicing
    assert_equal [], array[4,0]               # Empty slice when starting index is just at the end
    assert_equal [], array[4,100]             # No more elements beyond index 4
    assert_equal nil, array[5,0]              # Out of bounds index returns nil, index 5
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class          # A range is an instance of Range

    assert_not_equal [1, 2, 3, 4, 5], (1..5)  # A range is not an array, they are different classes

    assert_equal [1, 2, 3, 4, 5], (1..5).to_a # Converting a range into an array
    assert_equal [1, 2, 3, 4], (1...5).to_a   # Exclusive range, doesn't include 5
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]  # Inclusive range from index 0 to 2
    assert_equal [:peanut, :butter], array[0...2]       # Exclusive range, excludes index 2
    assert_equal [:and, :jelly], array[2..-1]           # Slice from index 2 to the last element
  end

  def test_pushing_and_popping_arrays
    array = [1, 2]
    array.push(:last)

    assert_equal [1, 2, :last], array          # Pushed :last to the end of the array

    popped_value = array.pop
    assert_equal :last, popped_value           # Popped the last element :last
    assert_equal [1, 2], array                 # After pop, array is back to [1, 2]
  end

  def test_shifting_arrays
    array = [1, 2]
    array.unshift(:first)

    assert_equal [:first, 1, 2], array         # :first is added to the beginning of the array

    shifted_value = array.shift
    assert_equal :first, shifted_value         # Shift removes the first element, :first
    assert_equal [1, 2], array                 # After shift, the array is back to [1, 2]
  end

end
