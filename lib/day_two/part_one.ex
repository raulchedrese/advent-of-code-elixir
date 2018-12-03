defmodule DayTwo.PartOne do
  @spec get_checksum(list(charlist)) :: number()
  def get_checksum(codes) do
    codes
    |> Enum.map(fn code -> String.graphemes(code) |> count_chars() |> count_totals() end)
    |> Enum.reduce(%{double: 0, triple: 0}, fn count, acc ->
      %{double: acc.double + count.double, triple: acc.triple + count.triple}
    end)
    |> checksum()
  end

  @spec count_chars(charlist()) :: %{optional(char) => number()}
  def count_chars(chars) do
    Enum.reduce(chars, %{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)
  end

  @spec count_totals(%{optional(char) => number()}) :: %{
          double: number(),
          triple: number()
        }
  def count_totals(char_counts) do
    Enum.reduce(char_counts, %{double: 0, triple: 0}, fn {_char, count}, acc ->
      case count do
        2 ->
          Map.put(acc, :double, 1)

        3 ->
          Map.put(acc, :triple, 1)

        _ ->
          acc
      end
    end)
  end

  @spec checksum(%{double: number(), triple: number()}) :: number()
  def checksum(char_counts) do
    char_counts.double * char_counts.triple
  end

  @spec run() :: :ok
  def run do
    File.read!("./input/day_two")
    |> String.split("\n")
    |> get_checksum()
    |> IO.puts()
  end
end
