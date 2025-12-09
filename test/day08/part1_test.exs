defmodule AoC2025.Day08.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day08.Part1
  import AoC2025.Day08.Part1
  import TestHelper

  test "runs for sample input" do
    assert 40 == run(read_example(:day08), 10)
  end
end
