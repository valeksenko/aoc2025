defmodule AoC2025.Day11.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/11
  """
  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.reduce(%{}, &to_connection/2)
    |> find_paths("you", "out")
    |> length()
  end

  defp find_paths(devices, start, finish) do
    start
    |> find_path({[], []}, finish, devices)
    |> elem(1)
  end

  defp find_path(finish, {visited, paths}, finish, _), do: {[], [visited | paths]}

  defp find_path(device, {visited, paths}, finish, devices) do
    case devices[device] do
      nil ->
        {[], paths}

      current ->
        current |> Enum.reduce({[device | visited], paths}, &find_path(&1, &2, finish, devices))
    end
  end

  defp to_connection(data, connections) do
    [input, outputs] = String.split(data, ": ")

    connections
    |> Map.put(input, String.split(outputs, " "))
  end
end
