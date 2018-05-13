defmodule QsPhoenixWeb.MealFoodControllerTest do
  use QsPhoenixWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create meal_food" do
    test "renders meal_food when data is valid", %{conn: conn} do
      conn = post conn, meal_food_path(conn, :create, 1, 4)
      assert %{"message" => "Successfully added Yogurt to Breakfast"} = json_response(conn, 201)

      new_meal_food = %{ "id" => 4, "name" => "Yogurt", "calories" => 550}
      conn = get conn, meal_path(conn, :show, 1)
      assert List.last(json_response(conn, 200)["foods"]) == new_meal_food
    end

    test "renders a 404 when meal or food with given ids DNE", %{conn: conn} do
      assert_error_sent :not_found, fn ->
        post conn, meal_food_path(conn, :create, 5, 1)
      end

      assert_error_sent :not_found, fn ->
        post conn, meal_food_path(conn, :create, 1, 8)
      end
    end
  end

  describe "delete meal_food" do
    test "deletes chosen meal_food", %{conn: conn} do
      conn = delete conn, meal_food_path(conn, :delete, 1, 1)
      assert %{"message" => "Successfully removed Banana from Breakfast"} = json_response(conn, 200)

      conn = get conn, meal_path(conn, :show, 1)
      breakfast_foods = Enum.map(json_response(conn, 200)["foods"], fn(food) -> food["name"] end)
      assert breakfast_foods == ["Yogurt", "Apple"]
    end

    test "returns a 404 if meal_food does not exist", %{conn: conn} do
      assert_error_sent :not_found, fn ->
        delete conn, meal_food_path(conn, :delete, 1, 3)
      end
    end
  end
end
