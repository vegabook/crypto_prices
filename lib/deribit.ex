defmodule Deribit do
  use GenServer

  @base_url "wss://ws-api.binance.com:443/ws-api/v3"
  @test_url "wss://testnet.binance.vision/ws-api/v3"

  @impl true
  def init(opts) do
    {:ok, opts}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_info({:websocket, :text, msg}, state) do
    IO.puts(msg)
    {:noreply, state}
  end

  @impl true
  def handle_cast({:subscribe, topic}, state) do
    {:noreply, state}
  end


end

