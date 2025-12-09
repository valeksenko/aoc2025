defmodule AoC2025.Day08.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/8
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data, amount \\ 1_000) do
    data
    |> Enum.map(&to_coord/1)
    |> unique_pairs()
    |> Enum.sort_by(&distance/1)
    |> Enum.take(amount)
    |> Enum.reduce([], &to_circuit/2)
    |> Enum.map(&MapSet.size/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  defp to_circuit({c1, c2}, circuits) do
    case Enum.find_index(circuits, &MapSet.member?(&1, c1)) do
      nil ->
        case Enum.find_index(circuits, &MapSet.member?(&1, c2)) do
          nil -> [MapSet.new([c1, c2]) | circuits]
          idx -> List.update_at(circuits, idx, &MapSet.put(&1, c1))
        end

      idx1 ->
        case Enum.find_index(circuits, &MapSet.member?(&1, c2)) do
          nil ->
            List.update_at(circuits, idx1, &MapSet.put(&1, c2))

          ^idx1 ->
            circuits

          idx2 ->
            circuits
            |> List.update_at(idx1, &MapSet.union(&1, Enum.at(circuits, idx2)))
            |> List.delete_at(idx2)
        end
    end
  end

  defp to_coord(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  defp unique_pairs(list) do
    Enum.reduce(
      list,
      [],
      fn e1, acc ->
        acc ++ for e2 <- list, e1 < e2, do: {e1, e2}
      end
    )
  end

  defp distance({c1, c2}) do
    Enum.zip(c1, c2)
    |> Enum.sum_by(fn {p1, p2} -> (p1 - p2) ** 2 end)
    |> :math.sqrt()
  end
end
