defmodule AoC2025.Day03.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/3#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.map(&to_bank/1)
    |> Enum.map(&max_joltage/1)
    |> Enum.sum()
  end

  defp max_joltage(bank) do
    11..0//-1
    |> Enum.reduce({[], bank}, &find_max/2)
    |> elem(0)
    |> Enum.reverse()
    |> Integer.undigits()
  end

  defp find_max(n, {nums, bank}) do
    with max <- bank |> Enum.drop(-n) |> Enum.max() do
      {
        [max | nums],
        bank |> Enum.drop_while(&(&1 < max)) |> tl()
      }
    end
  end

  defp to_bank(data) do
    data
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end
end
