defmodule QsPhoenixWeb.MealFoodControllerTest do
  use QsPhoenixWeb.ConnCase

  # alias QsPhoenix.Meals
  # alias QsPhoenix.Meals.MealFood
  #
  @create_attrs %{meal_id: 1, food_id: 4}

  # def fixture(:meal_food) do
  #   {:ok, meal_food} = Meals.create_meal_food(@create_attrs)
  #   meal_food
  # end

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
  #
  # describe "delete meal_food" do
  #   setup [:create_meal_food]
  #
  #   test "deletes chosen meal_food", %{conn: conn, meal_food: meal_food} do
  #     conn = delete conn, meal_food_path(conn, :delete, meal_food)
  #     assert response(conn, 204)
  #     assert_error_sent 404, fn ->
  #       get conn, meal_food_path(conn, :show, meal_food)
  #     end
  #   end
  # end
  #
  # defp create_meal_food(_) do
  #   meal_food = fixture(:meal_food)
  #   {:ok, meal_food: meal_food}
  # end
end
