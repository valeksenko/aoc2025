defmodule AoC2025.Day01.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day01.Part1
  import AoC2025.Day01.Part1
  import TestHelper

  test "runs for sample input" do
    assert 3 == run(read_example(:day01))
  end
end
