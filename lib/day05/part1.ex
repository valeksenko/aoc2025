defmodule AoC2025.Day05.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/5
  """
  import AoC2025.Day05.Parser

  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> parse_ingridients()
    |> count_fresh()
  end

  defp count_fresh({fresh_ranges, ingridients}) do
    ingridients
    |> Enum.count(&fresh?(&1, fresh_ranges))
  end

  defp fresh?(id, ranges) do
    ranges
    |> Enum.any?(&(id in &1))
  end
end
