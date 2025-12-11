defmodule AoC2025.Day10.Parser do
  import NimbleParsec

  amounts =
    times(
      ignore(optional(string(",")))
      |> integer(min: 1),
      min: 1
    )
    |> wrap()

  button =
    ignore(string("("))
    |> concat(amounts)
    |> ignore(string(") "))

  buttons =
    repeat(button)
    |> wrap()

  machine =
    ignore(string("["))
    |> ascii_string([?., ?#], min: 1)
    |> ignore(string("] "))
    |> concat(buttons)
    |> ignore(string("{"))
    |> concat(amounts)
    |> ignore(string("}"))

  # [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
  defparsec(:parse, machine |> eos())

  def parse_machine(data) do
    data
    |> parse()
    |> to_machine()
  end

  defp to_machine({:ok, [lights, buttons, joltage], "", _, _, _}),
    do: [String.graphemes(lights), buttons, joltage]
end
