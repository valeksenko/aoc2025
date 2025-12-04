defmodule AoC2025.Day04.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/4
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  @roll "@"
  @max 4
  @neighbors for x <- -1..1, y <- -1..1, {x, y} != {0, 0}, do: {x, y}

  def run(data) do
    data
    |> to_rolls()
    |> count_accessable()
  end

  defp count_accessable(diagram) do
    diagram
    |> Enum.count(fn roll -> accessable_count(roll, diagram) < @max end)
  end

  defp accessable_count({x, y}, diagram) do
    @neighbors
    |> Enum.count(fn {xd, yd} -> diagram |> Enum.member?({x + xd, y + yd}) end)
  end

  defp to_rolls(data) do
    data
    |> Enum.with_index()
    |> Enum.flat_map(&add_row/1)
  end

  defp add_row({row, y}) do
    row
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce([], fn {v, x}, rolls -> if v == @roll, do: [{x, y} | rolls], else: rolls end)
  end
end
