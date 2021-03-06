defmodule GalleryWeb.Router do
  use GalleryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    #plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {GalleryWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GalleryWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/gallery", GalleryLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", GalleryWeb do
  #   pipe_through :api
  # end
end
