defmodule Timer.Workers.Greeter do
  use GenServer

  require Logger

  def start_link(opts) do
    {:ok, who_to_greet} =
      opts
      |> Keyword.fetch(:who_to_greet)

    name =
      who_to_greet
      |> String.downcase()
      |> String.to_atom()

    state = %{counter: 0, who_to_greet: who_to_greet}

    GenServer.start_link(__MODULE__, state, name: name)
  end

  def init(state) do
    # Uncomment this to have the worker schedule some work
    #schedule()

    :ok = :pg2.join(:family, self())

    {:ok, state}
  end

  def handle_info(:work, state) do
    schedule()

    new_state = work(state)

    {:noreply, new_state}
  end

  def handle_info(:hi, state) do
    Logger.info("Hi! I'm #{state.who_to_greet}")

    {:noreply, state}
  end

  def schedule() do
    Process.send_after(self(), :work, 1000)
  end

  def work(state) do
    Logger.info("Hi #{state.who_to_greet}")

    # Map.put(state, :counter, state.counter + 1)
    state
  end
end
