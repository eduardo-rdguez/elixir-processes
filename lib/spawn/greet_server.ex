defmodule Spawn.GreetServer do
  @moduledoc """
  Documentation for `Spawn.GreetServer`.
  """

  alias Spawn.Greet

  def start do
    spawn(__MODULE__, :handle_message, [])
  end

  def handle_message do
    receive do
      {:hi, name} ->
        Greet.hi(name)

      {:hello, name} ->
        Greet.hello(name)
    end

    handle_message()
  end
end
