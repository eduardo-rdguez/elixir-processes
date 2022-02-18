defmodule Spawn.Player do
  defstruct name: ""

  alias Spawn.Player

  def start(player) do
    pid = spawn(__MODULE__, :new, [%Player{name: player}])
    Process.register(pid, :player)
  end

  def new(player) do
    player =
      receive do
        {:get, key, pid} ->
          send(pid, {:value, Map.get(player, key)})
          player

        {:update, key, value} ->
          Map.put(player, key, value)
      end

    new(player)
  end

  def get(key) do
    send(:player, {:get, key, self()})

    receive do
      {:value, value} ->
        value
    end
  end

  def update(key, value) do
    send(:player, {:update, key, value})
  end
end
