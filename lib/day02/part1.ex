defmodule AoC2025.Day02.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> to_ranges()
    |> Enum.flat_map(&invalid/1)
    |> Enum.sum()
  end

  defp invalid(range) do
    range
    |> Enum.filter(&invalid?(Integer.digits(&1)))
  end

  defp invalid?(digits) do
    with {h1, h2} <- Enum.split(digits, div(length(digits), 2)), do: h1 == h2
  end

  defp to_ranges(data) do
    data
    |> hd()
    |> String.split(",")
    |> Enum.map(&String.split(&1, "-"))
    |> Enum.map(fn [n1, n2] -> String.to_integer(n1)..String.to_integer(n2) end)
  end
end
