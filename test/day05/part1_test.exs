defmodule AoC2025.Day05.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day05.Part1
  import AoC2025.Day05.Part1
  import TestHelper

  test "runs for sample input" do
    assert 3 == run(read_example_file(:day05))
  end
end
