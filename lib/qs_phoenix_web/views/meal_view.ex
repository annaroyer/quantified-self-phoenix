defmodule QsPhoenixWeb.MealView do
  use QsPhoenixWeb, :view
  alias QsPhoenixWeb.MealView

  def render("index.json", %{meals: meals}) do
    render_many(meals, MealView, "meal.json")
  end

  def render("show.json", %{meal: meal}) do
    render_one(meal, MealView, "meal.json")
  end

  def render("meal.json", %{meal: meal}) do
    %{id: meal.id,
      name: meal.name,
      foods: render_many(meal.foods, QsPhoenixWeb.FoodView, "food.json")
     }
  end
end
