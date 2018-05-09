defmodule QsPhoenixWeb.Router do
  use QsPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", QsPhoenixWeb do
    pipe_through :api
  end
end
