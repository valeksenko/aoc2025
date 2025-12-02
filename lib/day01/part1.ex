defmodule AoC2025.Day01.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/1
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
    |> Enum.count(&(&1 == 0))
  end

  defp to_op(<<"L", num::binary>>), do: -String.to_integer(num)
  defp to_op(<<"R", num::binary>>), do: String.to_integer(num)

  defp dial(turns, pos) do
    with next <- Integer.mod(pos + turns, @positons), do: {next, next}
  end
end
