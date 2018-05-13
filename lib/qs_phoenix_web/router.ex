defmodule QsPhoenixWeb.Router do
  use QsPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", QsPhoenixWeb do
    pipe_through :api

    resources "/foods", FoodController, except: [:new, :edit]
    resources "/meals", MealController, only: [:index]
  end
end
