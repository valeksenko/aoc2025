defmodule AoC2025.Day05.Parser do
  @moduledoc false

  import NimbleParsec

  new_line = ascii_string([?\n], 1)
  id = integer(min: 1)

  range =
    id
    |> ignore(string("-"))
    |> concat(id)
    |> reduce({:to_range, []})
    |> ignore(new_line)

  ingridient =
    id
    |> ignore(optional(new_line))

  ingridients =
    repeat(range)
    |> wrap()
    |> ignore(new_line)
    |> wrap(repeat(ingridient))

  # 12-18
  #
  # 1
  defparsec(:parse, ingridients |> eos())

  def parse_ingridients(data) do
    data
    |> parse()
    |> to_ingridients()
  end

  defp to_ingridients({:ok, [fresh, ingridients], "", _, _, _}),
    do: {
      fresh,
      ingridients
    }

  defp to_range([start, finish]), do: start..finish
end
