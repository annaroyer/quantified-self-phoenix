defmodule QsPhoenixWeb.Router do
  use QsPhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", QsPhoenixWeb do
    pipe_through :api

    resources "/foods", FoodController, except: [:new, :edit]
    resources "/meals", MealController, only: [:index]

    scope "/meals/:meal_id/foods" do
      get "/", MealController, :show

      post "/:id", MealFoodController, :create
      delete "/:id", MealFoodController, :delete
    end
  end
end
