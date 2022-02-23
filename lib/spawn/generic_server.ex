defmodule Spawn.GenericServer do
  @moduledoc """
  Documentation for `Spawn.GenericServer`.
  """

  def start(module, parent \\ self(), init \\ []) do
    spawn(__MODULE__, :loop, [module, parent, init])
  end

  def call(pid, msg) do
    send(pid, {:call, self(), msg})

    receive do
      {:ok, result} -> result
    end
  end

  def cast(pid, msg) do
    send(pid, {:cast, msg})
  end

  def loop(callback_module, parent, init) do
    receive do
      {:cast, msg} ->
        {:no_reply, new_state} = callback_module.handle_cast(msg, init)
        send(parent, new_state)
        loop(callback_module, parent, new_state)

      {:call, response, msg} ->
        {:reply, result, new_state} = callback_module.handle_call(msg, parent, init)
        send(response, {:ok, result})
        loop(callback_module, parent, new_state)
    end
  end
end
