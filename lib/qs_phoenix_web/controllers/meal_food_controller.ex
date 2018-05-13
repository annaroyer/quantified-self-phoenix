defmodule QsPhoenixWeb.MealFoodController do
  use QsPhoenixWeb, :controller

  alias QsPhoenix.Meals
  alias QsPhoenix.Foods
  alias QsPhoenix.Meals.MealFood

  action_fallback QsPhoenixWeb.FallbackController

  def create(conn, %{"meal_id" => meal_id, "id" => id}) do
    food_name = Foods.get_food!(id).name
    meal_name = Meals.get_meal!(meal_id).name

    with {:ok, %MealFood{}} <- Meals.create_meal_food(%{meal_id: meal_id, food_id: id}) do
      conn
      |> put_status(:created)
      |> render("show.json", message: "Successfully added #{food_name} to #{meal_name}")
    end
  end

  def delete(conn, %{"meal_id" => meal_id, "id" => id}) do
    meal_food = Meals.get_meal_food!([meal_id: meal_id, food_id: id])

    with {:ok, %MealFood{}} <- Meals.delete_meal_food(meal_food) do
      conn
      |> put_status(:ok)
      |> render("show.json", message: "Successfully removed #{meal_food.food.name} from #{meal_food.meal.name}")
    end
  end
end
