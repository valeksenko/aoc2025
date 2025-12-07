defmodule AoC2025.Day07.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/7
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
    |> Enum.reduce({MapSet.new([start]), 0}, &split/2)
    |> elem(1)
  end

  defp split({x, _}, {beams, count}) do
    if MapSet.member?(beams, x) do
      {beams |> MapSet.delete(x) |> MapSet.put(x - 1) |> MapSet.put(x + 1), count + 1}
    else
      {beams, count}
    end
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
