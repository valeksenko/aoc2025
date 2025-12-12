defmodule AoC2025.Day11.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day11.Part2
  import AoC2025.Day11.Part2
  import TestHelper

  test "runs for sample input" do
    assert 2 == run(read_example(:day11_1))
  end
end
