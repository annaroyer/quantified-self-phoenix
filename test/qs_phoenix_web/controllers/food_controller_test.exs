defmodule QsPhoenixWeb.FoodControllerTest do
  use QsPhoenixWeb.ConnCase

  alias QsPhoenix.Foods

  @create_attrs %{calories: 200, name: "Crackers"}
  @update_attrs %{calories: 243, name: "Chocolate Covered Banana"}
  @no_name %{calories: 400}
  @no_calories %{name: "Crackers"}

  def fixture(:food) do
    {:ok, food} = Foods.create_food(@create_attrs)
    food
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foods", %{conn: conn} do
      conn = get conn, food_path(conn, :index)

      all_foods = [%{"id" => 1, "name" => "Banana", "calories" => 150},
                   %{"id" => 2, "name" => "Bagel Bites - Four Cheese", "calories" => 650},
                   %{"id" => 3, "name" => "Chicken Burrito", "calories" => 800},
                   %{"id" => 4, "name" => "Yogurt", "calories" => 550},
                   %{"id" => 5, "name" => "Gum", "calories" => 50},
                   %{"id" => 6, "name" => "Cheese", "calories" => 400},
                   %{"id" => 7, "name" => "Apple", "calories" => 220}]

      assert json_response(conn, 200) == all_foods
    end
  end

  describe "show food" do
    test "renders food with given id" do
      conn = get build_conn(), food_path(build_conn(), :show, 1)
      assert json_response(conn, 200) == %{"id" => 1, "name" => "Banana", "calories" => 150}
    end

    test "renders food with different given id" do
      conn = get build_conn(), food_path(build_conn(), :show, 4)
      assert json_response(conn, 200) == %{"id" => 4, "calories" => 550, "name" => "Yogurt"}
    end

    test "returns 404 when food with given id does not exist" do
      assert_error_sent :not_found, fn ->
         get build_conn(), food_path(build_conn(), :show, 9)
      end
    end
  end

  describe "create food" do
    test "renders food when data is valid", %{conn: conn} do
      conn = post conn, food_path(conn, :create), food: @create_attrs
      assert %{"id" => 8, "name" => "Crackers", "calories" => 200} == json_response(conn, 201)
    end

    test "renders errors when there is no name", %{conn: conn} do
       conn = post conn, food_path(conn, :create), food: @no_name
       assert response(conn, 400) == ""
    end

    test "renders errors when there are no calories" do
      conn = post build_conn(), food_path(build_conn(), :create), food: @no_calories
      assert response(conn, 400) == ""
    end
  end

  describe "update food" do
    test "renders food when data is valid", %{conn: conn} do
      choco_banana = %{"id" => 1,"calories" => 243,"name" => "Chocolate Covered Banana"}

      conn = put conn, food_path(conn, :update, 1), food: @update_attrs
      assert json_response(conn, 200) == choco_banana

      conn = get build_conn(), food_path(build_conn(), :show, 1)
      assert json_response(conn, 200) == choco_banana
    end

    test "returns a 404 when food with given id does not exist", %{conn: conn} do
      assert_error_sent :not_found, fn ->
        put conn, food_path(conn, :update, 8), food: @update_attrs
      end
    end
  end

  describe "delete food" do
    test "deletes chosen food", %{conn: conn} do
      conn = delete conn, food_path(conn, :delete, 1)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, food_path(conn, :show, 1)
      end
    end

    test "returns a 404 when food with given id does not exist", %{conn: conn} do
      assert_error_sent :not_found, fn ->
        delete conn, food_path(conn, :delete, 8)
      end
    end
  end
end
