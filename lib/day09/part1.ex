defmodule AoC2025.Day09.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/9
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.map(&to_coord/1)
    |> find_largest()
    |> rectangle_size()
  end

  defp find_largest(coordinates) do
    coordinates
    |> unique_pairs()
    |> Enum.max_by(&rectangle_size/1)
  end

  defp to_coord(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  defp unique_pairs(list) do
    coords = Enum.with_index(list)
    for {c1, i} <- coords, {c2, j} <- coords, j > i, do: {c1, c2}
  end

  defp rectangle_size({[x1, y1], [x2, y2]}), do: (abs(x1 - x2) + 1) * (abs(y1 - y2) + 1)
end
