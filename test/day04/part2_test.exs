defmodule AoC2025.Day04.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day04.Part2
  import AoC2025.Day04.Part2
  import TestHelper

  test "runs for sample input" do
    assert 43 == run(read_example(:day04))
  end
end
