defmodule AoC2025.Day05.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/5#part2
  """
  import AoC2025.Day05.Parser

  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> parse_ingridients()
    |> count_fresh()
  end

  defp count_fresh({fresh_ranges, _ingridients}) do
    fresh_ranges
    |> Enum.sort_by(&(&1.first))
    |> Enum.reduce([], &collect_fresh/2)
    |> Enum.sum_by(&Range.size/1)
  end

  defp collect_fresh(range, []), do: [range]

  defp collect_fresh(range, ranges) do
    ranges
    #|>  ...
  end

  defp cover(r1, r2) when (r1.first <= r2.first) and (r1.last >= r2.last), do: [r1]
  defp cover(r1, r2) when (r2.first <= r1.first) and (r2.last >= r1.last), do: [r2]
  defp cover(r1, r2) when (r1.first < r2.first) and (r1.last < r2.last), do: [r1, (r1.last + 1)..r2.last]
  defp cover(r1, r2) when (r2.first < r1.first) and (r2.last < r1.last), do: [r2, (r2.last + 1)..r1.last]
  defp cover(r1, r2), do: [r1, r2]
end
