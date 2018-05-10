defmodule QsPhoenixWeb.FoodControllerTest do
  use QsPhoenixWeb.ConnCase

  alias QsPhoenix.Foods
  alias QsPhoenix.Foods.Food

  @create_attrs %{calories: 142, name: "Banana"}
  @update_attrs %{calories: 243, name: "Chocolate Covered Banana"}
  @invalid_attrs %{calories: nil, name: nil}

  def fixture(:food) do
    {:ok, food} = Foods.create_food(@create_attrs)
    food
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    @tag individual_test: "index"
    test "lists all foods", %{conn: conn} do
      foods = [ %{name: "Banana", calories: 150},
                %{name: "Bagel Bites - Four Cheese", calories: 650},
                %{name: "Chicken Burrito", calories: 800},
                %{name: "Yogurt", calories: 550},
                %{name: "Gum", calories: 50},
                %{name: "Cheese", calories: 400},
                %{name: "Apple", calories: 220} ]

      Enum.each(foods, fn food -> Foods.create_food(food) end )

      conn = get conn, food_path(conn, :index)

      expected = [%{"id" => 1, "name" => "Banana", "calories" => 150},
                  %{"id" => 2, "name" => "Bagel Bites - Four Cheese", "calories" => 650},
                  %{"id" => 3, "name" => "Chicken Burrito", "calories" => 800},
                  %{"id" => 4, "name" => "Yogurt", "calories" => 550},
                  %{"id" => 5, "name" => "Gum", "calories" => 50},
                  %{"id" => 6, "name" => "Cheese", "calories" => 400},
                  %{"id" => 7, "name" => "Apple", "calories" => 220}]

      assert json_response(conn, 200) == expected
    end
  end

  # describe "create food" do
  #   test "renders food when data is valid", %{conn: conn} do
  #     conn = post conn, food_path(conn, :create), food: @create_attrs
  #     assert %{"id" => id} = json_response(conn, 201)["data"]
  #
  #     conn = get conn, food_path(conn, :show, id)
  #     assert json_response(conn, 200)["data"] == %{
  #       "id" => id,
  #       "calories" => 42,
  #       "name" => "some name"}
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post conn, food_path(conn, :create), food: @invalid_attrs
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end
  #
  # describe "update food" do
  #   setup [:create_food]
  #
  #   test "renders food when data is valid", %{conn: conn, food: %Food{id: id} = food} do
  #     conn = put conn, food_path(conn, :update, food), food: @update_attrs
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]
  #
  #     conn = get conn, food_path(conn, :show, id)
  #     assert json_response(conn, 200)["data"] == %{
  #       "id" => id,
  #       "calories" => 43,
  #       "name" => "some updated name"}
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn, food: food} do
  #     conn = put conn, food_path(conn, :update, food), food: @invalid_attrs
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end
  #
  # describe "delete food" do
  #   setup [:create_food]
  #
  #   test "deletes chosen food", %{conn: conn, food: food} do
  #     conn = delete conn, food_path(conn, :delete, food)
  #     assert response(conn, 204)
  #     assert_error_sent 404, fn ->
  #       get conn, food_path(conn, :show, food)
  #     end
  #   end
  # end
  #
  defp create_food(_) do
    food = fixture(:food)
    {:ok, food: food}
  end
end
