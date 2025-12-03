defmodule AoC2025.Day03.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day03.Part2
  import AoC2025.Day03.Part2
  import TestHelper

  test "runs for sample input" do
    assert 3_121_910_778_619 == run(read_example(:day03))
  end
end
