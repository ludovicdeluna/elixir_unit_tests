defmodule ElixirUnitTestsTest do
  use ExUnit.Case
  doctest ElixirUnitTests

  test "greets the world" do
    assert ElixirUnitTests.hello() == :world
  end
end
