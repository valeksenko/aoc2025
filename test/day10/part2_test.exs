defmodule AoC2025.Day10.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day10.Part2
  import AoC2025.Day10.Part2
  import TestHelper

  test "runs for sample input" do
    assert 33 == run(read_example(:day10))
  end
end
