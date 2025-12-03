defmodule AoC2025.Day03.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/3
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
    with first <- bank |> Enum.drop(-1) |> Enum.max() do
      with second <- bank |> Enum.drop_while(&(&1 < first)) |> tl() |> Enum.max() do
        Integer.undigits([first, second])
      end
    end
  end

  defp to_bank(data) do
    data
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end
end
