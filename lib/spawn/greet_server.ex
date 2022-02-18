defmodule Spawn.GreetServer do
  @moduledoc """
  Documentation for `Spawn.GreetServer`.
  """

  alias Spawn.Greet

  def start do
    spawn(__MODULE__, :handle_message, [self()])
  end

  def handle_message(parent) do
    receive do
      {:hi, name} ->
        greet = Greet.hi(name)
        send(parent, greet)

      {:hello, name} ->
        greet = Greet.hello(name)
        send(parent, greet)
    end

    handle_message(parent)
  end
end
