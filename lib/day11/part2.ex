defmodule AoC2025.Day11.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/11#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.reduce(%{}, &to_connection/2)
    |> count_paths()
  end

  defp count_paths(devices) do
    [
      [
         {"svr", "dac"},
         {"dac", "fft"},
         {"fft", "out"},
      ],
      [
         {"svr", "fft"},
         {"fft", "dac"},
         {"dac", "out"},
      ]
    ]
    |> Enum.sum_by(fn p ->
      p
      |> Enum.map(fn {start, finish} ->
        find_path(start, 0, [], finish, devices)
      end)
      |> Enum.product()
    end)
  end

  defp find_path(finish, paths, _, finish, _), do: paths + 1

  defp find_path(device, paths, visited, finish, devices) do
    case devices[device] do
      nil ->
        paths

      current ->
        current |> Enum.reduce(paths, &find_path(&1, &2, [device | visited], finish, devices))
    end
  end

  defp to_connection(data, connections) do
    [input, outputs] = String.split(data, ": ")

    connections
    |> Map.put(input, String.split(outputs, " "))
  end
end
