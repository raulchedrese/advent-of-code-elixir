defmodule DayOne.PartOne do
  def run do
    File.read!("./input/day_one")
    |> String.split("\n")
    |> Enum.map(fn num -> String.to_integer(num) end)
    |> Enum.sum()
    |> IO.puts()
  end
end
