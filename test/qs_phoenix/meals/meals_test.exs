defmodule QsPhoenix.MealsTest do
  use QsPhoenix.DataCase

  alias QsPhoenix.Meals

  describe "meals" do
    alias QsPhoenix.Meals.Meal

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    test "list_meals/0 returns all meals" do
      assert Enum.count(Meals.list_meals()) == 4
    end

    test "get_meal!/1 returns the meal with given id" do
      meals = Meals.list_meals()
      assert Meals.get_meal!(1) == List.first(meals)
    end

    # test "change_meal/1 returns a meal changeset" do
    #   meal = meal_fixture()
    #   assert %Ecto.Changeset{} = Meals.change_meal(meal)
    # end
  end

  # describe "meal_foods" do
  #   alias QsPhoenix.Meals.MealFood
  #
  #   @valid_attrs %{}
  #   @update_attrs %{}
  #   @invalid_attrs %{}
  #
  #   def meal_food_fixture(attrs \\ %{}) do
  #     {:ok, meal_food} =
  #       attrs
  #       |> Enum.into(@valid_attrs)
  #       |> Meals.create_meal_food()
  #
  #     meal_food
  #   end
  #
  #   test "list_meal_foods/0 returns all meal_foods" do
  #     meal_food = meal_food_fixture()
  #     assert Meals.list_meal_foods() == [meal_food]
  #   end
  #
  #   test "get_meal_food!/1 returns the meal_food with given id" do
  #     meal_food = meal_food_fixture()
  #     assert Meals.get_meal_food!(meal_food.id) == meal_food
  #   end
  #
  #   test "create_meal_food/1 with valid data creates a meal_food" do
  #     assert {:ok, %MealFood{} = meal_food} = Meals.create_meal_food(@valid_attrs)
  #   end
  #
  #   test "create_meal_food/1 with invalid data returns error changeset" do
  #     assert {:error, %Ecto.Changeset{}} = Meals.create_meal_food(@invalid_attrs)
  #   end
  #
  #   test "update_meal_food/2 with valid data updates the meal_food" do
  #     meal_food = meal_food_fixture()
  #     assert {:ok, meal_food} = Meals.update_meal_food(meal_food, @update_attrs)
  #     assert %MealFood{} = meal_food
  #   end
  #
  #   test "update_meal_food/2 with invalid data returns error changeset" do
  #     meal_food = meal_food_fixture()
  #     assert {:error, %Ecto.Changeset{}} = Meals.update_meal_food(meal_food, @invalid_attrs)
  #     assert meal_food == Meals.get_meal_food!(meal_food.id)
  #   end
  #
  #   test "delete_meal_food/1 deletes the meal_food" do
  #     meal_food = meal_food_fixture()
  #     assert {:ok, %MealFood{}} = Meals.delete_meal_food(meal_food)
  #     assert_raise Ecto.NoResultsError, fn -> Meals.get_meal_food!(meal_food.id) end
  #   end
  #
  #   test "change_meal_food/1 returns a meal_food changeset" do
  #     meal_food = meal_food_fixture()
  #     assert %Ecto.Changeset{} = Meals.change_meal_food(meal_food)
  #   end
  # end
end
