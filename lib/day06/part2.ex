defmodule AoC2025.Day06.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/6#part2
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
    {ops, numbers} = List.pop_at(data, -1)

    ops
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&to_op/1)
    |> Enum.zip(extract_numbers(to_sizes(ops), numbers))
  end

  defp to_sizes(ops) do
    ops
    |> String.split(~r/(?=\S)/)
    |> tl()
    |> Enum.map(&String.length/1)
  end

  defp extract_numbers(sizes, numbers) do
    numbers
    |> Enum.map(&from_row(&1, sizes))
    |> Enum.zip()
    |> Enum.map(&to_numbers/1)
  end

  defp to_numbers(digits) do
    digits
    |> Tuple.to_list()
    |> Enum.zip()
    |> Enum.map(&to_number/1)
    # ignore empty spaces translated to 0
    |> Enum.reject(&(&1 == 0))
  end

  defp to_number(digits) do
    digits
    |> Tuple.to_list()
    |> Enum.reject(&(&1 == " "))
    |> Enum.map(&String.to_integer/1)
    |> Integer.undigits()
  end

  defp from_row(row, sizes) do
    sizes
    |> Enum.map_reduce(0, fn size, offset ->
      {row |> String.slice(offset, size) |> String.graphemes(), offset + size}
    end)
    |> elem(0)
  end

  defp to_op("+" <> _), do: &+/2
  defp to_op("*" <> _), do: &*/2
end
