defmodule AoC2025.Day04.Part2 do
  @moduledoc """
  @see https://adventofcode.com/2025/day/4#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  @roll "@"
  @max 4
  @neighbors for dx <- -1..1, dy <- -1..1, {dx, dy} != {0, 0}, do: {dx, dy}

  def run(data) do
    data
    |> to_rolls()
    |> count_inaccessible()
  end

  defp count_inaccessible(rolls) do
    length(rolls) - length(rolls |> MapSet.new() |> prune_inaccessible())
  end

  defp prune_inaccessible(rolls) do
    {inaccessible, accessible} = partition_accessible(rolls)

    if Enum.empty?(accessible) do
      inaccessible
    else
      prune_inaccessible(MapSet.new(inaccessible))
    end
  end

  defp partition_accessible(rolls) do
    rolls
    |> Enum.split_with(fn r ->
      neighbor_count(r, rolls) >= @max
    end)
  end

  defp neighbor_count({x, y}, rolls) do
    @neighbors
    |> Enum.count(fn {dx, dy} ->
      MapSet.member?(rolls, {x + dx, y + dy})
    end)
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
