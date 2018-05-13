defmodule QsPhoenixWeb.MealController do
  use QsPhoenixWeb, :controller

  alias QsPhoenix.Meals
  alias QsPhoenix.Meals.Meal

  action_fallback QsPhoenixWeb.FallbackController

  def index(conn, _params) do
    meals = Meals.list_meals()
    render(conn, "index.json", meals: meals)
  end

  # def show(conn, %{"id" => id}) do
  #   meal = Meals.get_meal!(id)
  #   render(conn, "show.json", meal: meal)
  # end
end
