defmodule AoC2025.Day08.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/8#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.map(&to_coord/1)
    |> find_latest()
  end

  defp find_latest(coordinates) do
    coordinates
    |> unique_pairs()
    |> Enum.sort_by(&distance/1)
    |> connect_circuits([], length(coordinates))
    |> Tuple.to_list()
    |> Enum.product_by(&hd/1)
  end

  defp connect_circuits([pair | pairs], circuits, total) do
    circuits = to_circuit(pair, circuits)

    if Enum.sum_by(circuits, &MapSet.size/1) >= total do
      pair
    else
      connect_circuits(pairs, circuits, total)
    end
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
    coords = Enum.with_index(list)
    for {c1, i} <- coords, {c2, j} <- coords, j > i, do: {c1, c2}
  end

  defp distance({c1, c2}) do
    Enum.zip(c1, c2)
    |> Enum.sum_by(fn {p1, p2} -> (p1 - p2) ** 2 end)
    |> :math.sqrt()
  end
end
