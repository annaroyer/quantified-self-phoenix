defmodule QsPhoenixWeb.MealFoodView do
  use QsPhoenixWeb, :view
  alias QsPhoenixWeb.MealFoodView

  def render("index.json", %{meal_foods: meal_foods}) do
    %{data: render_many(meal_foods, MealFoodView, "meal_food.json")}
  end

  def render("show.json", %{meal_food: meal_food}) do
    %{data: render_one(meal_food, MealFoodView, "meal_food.json")}
  end

  def render("meal_food.json", %{meal_food: meal_food}) do
    %{id: meal_food.id}
  end
end
