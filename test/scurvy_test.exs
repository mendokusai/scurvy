defmodule ScurvyTest do
  use ExUnit.Case
  doctest Scurvy

  test "greets the world" do
    assert Scurvy.hello() == :world
  end
end
