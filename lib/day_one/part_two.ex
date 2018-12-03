defmodule DayOne.PartTwo do
  def first_duplicate([], sum, past_sums, freq_changes),
    do: first_duplicate(freq_changes, sum, past_sums, freq_changes)

  def first_duplicate([num | tail], sum, past_sums, freq_changes) do
    new_sum = sum + num

    case in_list?(past_sums, sum) do
      true -> sum
      false -> first_duplicate(tail, new_sum, [sum | past_sums], freq_changes)
    end
  end

  def in_list?([], _item), do: false
  def in_list?([item | _tail], item), do: true
  def in_list?([_head | tail], item), do: in_list?(tail, item)

  def run() do
    freq_changes =
      File.read!("./input/day_one")
      |> String.split("\n")
      |> Enum.map(fn num -> String.to_integer(num) end)

    IO.puts(DayOne.PartTwo.first_duplicate(freq_changes, 0, [], freq_changes))
  end
end
