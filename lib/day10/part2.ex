defmodule AoC2025.Day10.Part2 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/10#part2
  """
  import AoC2025.Day10.Parser

  @behaviour AoC2025.Day

  @impl AoC2025.Day

  def run(data) do
    data
    |> Enum.map(&parse_machine/1)
    |> Enum.map(&match_goal/1)
    |> Enum.sum_by(&elem(&1, 1))
  end

  def match_goal([_lights, buttons, goal]) do
    all_zero = List.duplicate(0, length(goal))
    queue = :queue.from_list([{{nil, all_zero}, 0}])
    pressed = MapSet.new([{nil, all_zero}])
    found = fn {_, joltages} -> joltages == goal end
    press = fn {_, joltages} -> press_buttons(buttons, joltages, goal) end

    bfs(queue, pressed, press, found)
  end

  defp bfs(queue, pressed, press, found) do
    case :queue.out(queue) do
      {:empty, _} ->
        :no_solution

      {{:value, {s, d}}, q} ->
        cond do
          found.(s) ->
            {:ok, d}

          true ->
            {pressed, q} =
              Enum.reduce(press.(s), {pressed, q}, fn ns, {p, qq} ->
                if MapSet.member?(p, ns) do
                  {p, qq}
                else
                  {MapSet.put(p, ns), :queue.in({ns, d + 1}, qq)}
                end
              end)

            bfs(q, pressed, press, found)
        end
    end
  end

  defp press_buttons(buttons, joltages, goal) do
    buttons
    |> Enum.map(fn button ->
      {button, Enum.reduce(button, joltages, &press_button/2)}
    end)
    |> Enum.filter(fn {_, js} ->
      js
      |> Enum.with_index()
      |> Enum.all?(fn {j, idx} ->
        j <= Enum.at(goal, idx)
      end)
    end)
  end

  defp press_button(idx, joltages), do: List.update_at(joltages, idx, &(&1 + 1))
end
