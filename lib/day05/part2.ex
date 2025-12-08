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
    |> Enum.reduce([], &collect_fresh/2)
    |> Enum.sum_by(&Range.size/1)
  end

  defp collect_fresh(range, ranges) do
    ranges
    |> shrink(find_first(range.first, ranges), find_last(range.last, ranges))
  end

  defp find_first(n, ranges) do
    case Enum.find(ranges, nil, &(n in &1)) do
      nil -> n
      r -> r.first
    end
  end

  defp find_last(n, ranges) do
    case Enum.find(ranges, nil, &(n in &1)) do
      nil -> n
      r -> r.last
    end
  end

  defp shrink(ranges, first, last) do
    [first..last | Enum.filter(ranges, &Range.disjoint?(&1, first..last))]
  end
end
