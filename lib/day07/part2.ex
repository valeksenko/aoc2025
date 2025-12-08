defmodule AoC2025.Day07.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/7#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> parse()
    |> shine()
  end

  defp shine({diagram, start}) do
    diagram
    # sort by y
    |> Enum.sort_by(&elem(&1, 1))
    |> Enum.reduce(%{start => 1}, &split/2)
    |> Map.values()
    |> Enum.sum()
  end

  defp split({x, _}, timelines) do
    worlds = Map.get(timelines, x, 0)

    timelines
    |> Map.update(x - 1, worlds, &(&1 + worlds))
    |> Map.update(x + 1, worlds, &(&1 + worlds))
    |> Map.put(x, 0)
  end

  defp parse(data) do
    data
    |> Enum.with_index()
    |> Enum.reduce({MapSet.new(), nil}, &add_row/2)
  end

  defp add_row({row, y}, diagram) do
    row
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce(diagram, fn {v, x}, d -> add(d, {x, y}, v) end)
  end

  defp add({diagram, _}, {x, _}, "S"), do: {diagram, x}
  defp add({diagram, start}, pos, "^"), do: {MapSet.put(diagram, pos), start}
  defp add({diagram, start}, _, _), do: {diagram, start}
end
