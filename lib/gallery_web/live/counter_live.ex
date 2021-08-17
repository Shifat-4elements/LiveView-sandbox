# lib/gallery_web/live/counter_live.ex

defmodule GalleryWeb.CounterLive do
  use Phoenix.LiveView

  require Logger

  def mount(_params, _session, socket) do
    socket = assign(socket, :counter, 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <label>Counter: <%= @counter %></label>
    <button phx-click="incr">+</button>
    """
  end

  def handle_event("incr", _event, socket) do
    socket = update(socket, :counter, &(&1 + 1))
  {:noreply, socket}
  end
end
