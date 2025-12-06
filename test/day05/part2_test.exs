defmodule AoC2025.Day05.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day05.Part2
  import AoC2025.Day05.Part2
  import TestHelper

  test "runs for sample input" do
    assert 14 == run(read_example_file(:day05))
  end
end
