defmodule QsPhoenixWeb.MealControllerTest do
  use QsPhoenixWeb.ConnCase

  @meals [%{"id"=>1,
            "name"=>"Breakfast",
            "foods"=>[%{"id"=>1, "name"=>"Banana", "calories"=>150},
                      %{"id"=>4, "name"=>"Yogurt", "calories"=>550},
                      %{"id"=>7, "name"=>"Apple", "calories"=>220}]
           },
          %{"id"=>2,
            "name"=>"Snack",
            "foods"=>[%{"id"=>1, "name"=>"Banana", "calories"=>150},
                      %{"id"=>5, "name"=>"Gum", "calories"=>50},
                      %{"id"=>6, "name"=>"Cheese", "calories"=>400}]
           },
          %{"id"=>3,
            "name"=>"Lunch",
            "foods"=>[%{"id"=>2, "name"=>"Bagel Bites - Four Cheese", "calories"=>650},
                      %{"id"=>3, "name"=>"Chicken Burrito", "calories"=>800},
                      %{"id"=>7, "name"=>"Apple", "calories"=>220}]
           },
          %{"id"=>4,
            "name"=>"Dinner",
            "foods"=>[%{"id"=>1, "name"=>"Banana", "calories"=>150},
                      %{"id"=>2, "name"=>"Bagel Bites - Four Cheese", "calories"=>650},
                      %{"id"=>3, "name"=>"Chicken Burrito", "calories"=>800}]
           }
          ]

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all meals", %{conn: conn} do
      conn = get conn, meal_path(conn, :index)
      assert json_response(conn, 200) == @meals
    end
  end

  describe "show" do
    test "shows meal with given id", %{conn: conn} do
      conn = get conn, meal_meal_path(conn, :show, 1)
      assert json_response(conn, 200) == List.first(@meals)
    end

    test "renders 404 when meal with given id does not exist", %{conn: conn} do
      assert_error_sent :not_found, fn ->
        get conn, meal_meal_path(conn, :show, 8)
      end
    end
  end
end
