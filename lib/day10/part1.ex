defmodule AoC2025.Day10.Part1 do
  @moduledoc """
    @see https://adventofcode.com/2025/day/10
  """
  import AoC2025.Day10.Parser

  @behaviour AoC2025.Day

  @impl AoC2025.Day

  @on "#"
  @off "."
  @switch %{
    @on => @off,
    @off => @on
  }

  def run(data) do
    data
    |> Enum.map(&parse_machine/1)
    |> Enum.map(&match_goal/1)
    |> Enum.sum_by(&elem(&1, 1))
  end

  def match_goal([goal, buttons, _joltage]) do
    all_off = List.duplicate(@off, length(goal))
    queue = :queue.from_list([{{nil, all_off}, 0}])
    pressed = MapSet.new([{nil, all_off}])
    found = fn {_, lights} -> lights == goal end
    press = fn {_, lights} -> press_buttons(buttons, lights) end

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

  defp press_buttons(buttons, lights) do
    buttons
    |> Enum.map(fn button ->
      {button, Enum.reduce(button, lights, &press_button/2)}
    end)
  end

  defp press_button(idx, lights), do: List.update_at(lights, idx, fn n -> @switch[n] end)
end
