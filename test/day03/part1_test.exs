defmodule AoC2025.Day03.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day03.Part1
  import AoC2025.Day03.Part1
  import TestHelper

  test "runs for sample input" do
    assert 357 == run(read_example(:day03))
  end
end
