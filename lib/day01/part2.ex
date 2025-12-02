defmodule AoC2025.Day01.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/1#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  @positons 100
  @start 50

  def run(data) do
    data
    |> Enum.map(&to_op/1)
    |> Enum.map_reduce(@start, &dial/2)
    |> elem(0)
    |> Enum.sum()
  end

  defp to_op(<<"L", num::binary>>), do: -String.to_integer(num)
  defp to_op(<<"R", num::binary>>), do: String.to_integer(num)

  defp dial(turns, pos) do
    with next <- Integer.mod(pos + turns, @positons),
         do: {div(abs(turns), @positons) + adjust(pos, next, turns >= 0), next}
  end

  defp adjust(0, _, _), do: 0
  defp adjust(_, 0, _), do: 1
  defp adjust(pos, next, true) when next < pos, do: 1
  defp adjust(pos, next, false) when next > pos, do: 1
  defp adjust(_, _, _), do: 0
end
