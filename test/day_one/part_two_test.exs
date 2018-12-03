defmodule DayOnePartTwoTest do
  use ExUnit.Case

  test "returns false for empty list" do
    assert DayOne.PartTwo.in_list?([], 5) == false
  end

  test "returns true if element exists in single element list" do
    assert DayOne.PartTwo.in_list?([5], 5) == true
  end

  test "returns true if element exists in multi element list" do
    assert DayOne.PartTwo.in_list?([1, 3, 5], 3) == true
  end

  test "first duplicate returns duplicate for single iteration" do
    assert DayOne.PartTwo.first_duplicate([1, 2, -2], 0, [], [1, 2, -2]) == 1
    assert DayOne.PartTwo.first_duplicate([1, -1], 0, [], [1, -1]) == 0
  end

  test "first duplicate returns duplicate for multiple iterations" do
    assert DayOne.PartTwo.first_duplicate([3, 3, 4, -2, -4], 0, [], [3, 3, 4, -2, -4]) == 10
    assert DayOne.PartTwo.first_duplicate([-6, 3, 8, 5, -6], 0, [], [-6, 3, 8, 5, -6]) == 5
    assert DayOne.PartTwo.first_duplicate([7, 7, -2, -7, -4], 0, [], [7, 7, -2, -7, -4]) == 14
  end
end
