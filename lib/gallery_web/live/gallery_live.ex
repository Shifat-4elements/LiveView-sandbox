
defmodule GalleryWeb.GalleryLive do
  use Phoenix.LiveView, layout: {GalleryWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>LiveView is awesome!</h1>
    """
  end
end
