defmodule QsPhoenixWeb.MealFoodController do
  use QsPhoenixWeb, :controller

  alias QsPhoenix.Meals
  alias QsPhoenix.Foods
  alias QsPhoenix.Meals.MealFood

  action_fallback QsPhoenixWeb.FallbackController

  def create(conn, %{"meal_id" => meal_id, "id" => id}) do
    food_name = Foods.get_food!(id).name
    meal_name = Meals.get_meal!(meal_id).name
    with {:ok, %MealFood{} = meal_food} <- Meals.create_meal_food(%{meal_id: meal_id, food_id: id}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", meal_food_path(conn, :show, meal_food.meal_id, meal_food.food_id))
      |> render("show.json", message: "Successfully added #{food_name} to #{meal_name}")
    end
  end

  # def delete(conn, %{"id" => id}) do
  #   meal_food = Meals.get_meal_food!(id)
  #   with {:ok, %MealFood{}} <- Meals.delete_meal_food(meal_food) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
