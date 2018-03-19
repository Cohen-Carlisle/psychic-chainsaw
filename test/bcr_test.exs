defmodule BcrTest do
  use ExUnit.Case
  doctest Bcr

  test "greets the world" do
    assert Bcr.hello() == :world
  end
end
