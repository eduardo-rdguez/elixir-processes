defmodule ElixirProcessesTest do
  use ExUnit.Case
  doctest ElixirProcesses

  test "greets the world" do
    assert ElixirProcesses.hello() == :world
  end
end
