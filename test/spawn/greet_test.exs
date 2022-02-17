defmodule Spawn.GreetTest do
  use ExUnit.Case

  alias Spawn.Greet

  test "hi by name" do
    assert Greet.hi("Eduardo") == "Hi, Eduardo"
  end

  test "hello by name" do
    assert Greet.hello("Eduardo") == "Hello, Eduardo"
  end
end
