defmodule DayTwoPartOneTest do
  use ExUnit.Case

  test "get_checksum returns totals for codes" do
    codes = [
      "abcdef",
      "bababc",
      "abbcde",
      "abcccd",
      "aabcdd",
      "abcdee",
      "ababab"
    ]

    assert DayTwo.PartOne.get_checksum(codes) == 12
  end

  test "count_chars should return the occurrence count for each character in the string" do
    assert DayTwo.PartOne.count_chars(['a', 'b', 'a', 'b', 'b', 'c']) == %{
             'a' => 2,
             'b' => 3,
             'c' => 1
           }
  end

  test "count_totals should return the count of double and triple letters" do
    assert DayTwo.PartOne.count_totals(%{
             'a' => 2,
             'b' => 3,
             'c' => 2
           }) == %{
             double: 1,
             triple: 1
           }
  end

  test "checksum should calculate numerical checksum" do
    assert DayTwo.PartOne.checksum(%{double: 4, triple: 3}) == 12
  end
end
