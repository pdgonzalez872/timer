defmodule Timer.Workers.Hello do
  use GenServer

  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{counter: 0})
  end

  def init(state) do
    schedule()

    {:ok, state}
  end

  def handle_info(:work, state) do
    schedule()

    new_state = work(state)

    {:noreply, new_state}
  end

  def schedule() do
    Process.send_after(self(), :work, 1000)
  end

  def work(state) do
    Logger.info("Counter: #{state.counter}")

    Map.put(state, :counter, state.counter + 1)
  end
end
