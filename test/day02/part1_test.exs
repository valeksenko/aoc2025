defmodule AoC2025.Day02.Part1Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day02.Part1
  import AoC2025.Day02.Part1
  import TestHelper

  test "runs for sample input" do
    assert 1_227_775_554 == run(read_example(:day02))
  end
end
