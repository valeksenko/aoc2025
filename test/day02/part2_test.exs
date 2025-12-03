defmodule AoC2025.Day02.Part2Test do
  @moduledoc false
  use ExUnit.Case
  doctest AoC2025.Day02.Part2
  import AoC2025.Day02.Part2
  import TestHelper

  test "runs for sample input" do
    assert 4_174_379_265 == run(read_example(:day02))
  end
end
