defmodule Spawn.GreetServer do
  @moduledoc """
  Documentation for `Spawn.GreetServer`.
  """

  alias Spawn.Greet

  def handle_message do
    receive do
      {:hi, name} ->
        Greet.hello(name)

      {:hello, name} ->
        Greet.hello(name)
    end
  end
end
