defmodule AoC2025.Day09.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day09.Part2
  import AoC2025.Day09.Part2
  import TestHelper

  test "runs for sample input" do
    assert 24 == run(read_example(:day09))
  end
end
