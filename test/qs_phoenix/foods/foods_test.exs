defmodule QsPhoenix.FoodsTest do
  use QsPhoenix.DataCase

  alias QsPhoenix.Foods

  describe "foods" do
    alias QsPhoenix.Foods.Food

    @valid_attrs %{calories: 142, name: "Crackers"}
    @update_attrs %{calories: 243, name: "Chocolate Covered Banana"}
    @invalid_attrs %{calories: nil, name: nil}

    def food_fixture(attrs \\ %{}) do
      {:ok, food} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Foods.create_food()

      food
    end

    test "list_foods/0 returns all foods" do
      assert Enum.count(Foods.list_foods) == 7
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Foods.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      assert {:ok, %Food{} = food} = Foods.create_food(@valid_attrs)
      assert food.calories == 142
      assert food.name == "Crackers"
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %{}} = Foods.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      assert {:ok, food} = Foods.update_food(food, @update_attrs)
      assert %Food{} = food
      assert food.calories == 243
      assert food.name == "Chocolate Covered Banana"
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %{}} = Foods.update_food(food, @invalid_attrs)
      assert food == Foods.get_food!(food.id)
    end
    #
    # test "delete_food/1 deletes the food" do
    #   food = food_fixture()
    #   assert {:ok, %Food{}} = Foods.delete_food(food)
    #   assert_raise Ecto.NoResultsError, fn -> Foods.get_food!(food.id) end
    # end
    #
    # test "change_food/1 returns a food changeset" do
    #   food = food_fixture()
    #   assert %Ecto.Changeset{} = Foods.change_food(food)
    # end
  end
end
