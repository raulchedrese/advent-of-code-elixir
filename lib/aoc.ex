defmodule AOC do
  @moduledoc """
  Documentation for AOC.
  """

  @doc """
  AOC run.

  ## Examples

      iex> AOC.run()
      538
      1178

  """
  def run do
    DayOne.PartOne.run()
    DayOne.PartTwo.run()
  end
end
