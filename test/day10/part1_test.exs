defmodule AoC2025.Day10.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day10.Part1
  import AoC2025.Day10.Part1
  import TestHelper

  test "runs for sample input" do
    assert 7 == run(read_example(:day10))
  end
end
