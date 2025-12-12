defmodule AoC2025.Day11.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/11#part2
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.reduce(%{}, &to_connection/2)
    |> find_paths("svr", "out")
    |> Enum.filter(fn d ->
      Enum.any?(d, &(&1 == "dac"))
    end)
    |> Enum.filter(fn d ->
      Enum.any?(d, &(&1 == "fft"))
    end)
    |> length()
  end

  defp find_paths(devices, start, finish) do
    start
    |> find_path([], [], finish, devices)
  end

  defp find_path(finish, paths, visited, finish, _), do: [visited | paths]

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
