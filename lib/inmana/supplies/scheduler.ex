defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # async
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # sync
  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()
    schedule_notification()
    {:noreply, state}
  end

  # runs periodically
  # 1000 ms x 60 = 60 s for test
  # for prod would be a week for instance
  defp schedule_notification do
    # Process.send_after(self(), :generate, 1000 * 60 * 60 * 24 * 7)
    Process.send_after(self(), :generate, 1000 * 60)
  end
end
