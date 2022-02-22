defmodule Spawn.FibonacciServer do
  @moduledoc """
  Documentation for `FibonacciServer`.
  """

  alias Spawn.Fibonacci

  def handle_call({:compute, n}, parent, state) do
    case Map.get(state, n) do
      nil ->
        result = Fibonacci.sequence(n)
        send(parent, {:reply, result, Map.put(state, n, result)})

      result ->
        send(parent, {:reply, result, state})
    end
  end

  def handle_cast({:compute, n}, _parent, state) do
    case Map.get(state, n) do
      nil ->
        result = Fibonacci.sequence(n)
        {:no_reply, Map.put(state, n, result)}

      _result ->
        {:no_reply, state}
    end
  end
end
