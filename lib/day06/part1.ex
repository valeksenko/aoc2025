defmodule AoC2025.Day06.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/6
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> to_problems()
    |> Enum.map(&do_math/1)
    |> Enum.sum()
  end

  defp do_math({op, numbers}) do
    numbers
    |> Enum.reduce(op)
  end

  defp to_problems(data) do
    data
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.zip()
    |> Enum.map(&to_problem(Tuple.to_list(&1), []))
  end

  defp to_problem(["+"], numbers), do: {&+/2, numbers}
  defp to_problem(["*"], numbers), do: {&*/2, numbers}
  defp to_problem([n | rest], numbers), do: to_problem(rest, [String.to_integer(n) | numbers])
end
