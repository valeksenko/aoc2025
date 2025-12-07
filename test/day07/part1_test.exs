defmodule AoC2025.Day07.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day07.Part1
  import AoC2025.Day07.Part1
  import TestHelper

  test "runs for sample input" do
    assert 21 == run(read_example(:day07))
  end
end
