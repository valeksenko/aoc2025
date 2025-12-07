defmodule AoC2025.Day07.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day07.Part2
  import AoC2025.Day07.Part2
  import TestHelper

  test "runs for sample input" do
    assert 40 == run(read_example(:day07))
  end
end
