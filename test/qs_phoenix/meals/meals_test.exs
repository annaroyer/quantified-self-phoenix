defmodule QsPhoenix.MealsTest do
  use QsPhoenix.DataCase

  alias QsPhoenix.Meals

  describe "meals" do

    @valid_attrs %{name: "some name"}
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

  describe "meal_foods" do
    alias QsPhoenix.Meals.MealFood

    @valid_attrs %{meal_id: 3, food_id: 6}
    @find_attrs [meal_id: 3, food_id: 6]

    def meal_food_fixture(attrs \\ %{}) do
      {:ok, meal_food} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Meals.create_meal_food()

      meal_food
    end

    test "create_meal_food/1 with valid data creates a meal_food" do
      meal_food = meal_food_fixture()
      assert {:ok, %MealFood{} = meal_food} = Meals.create_meal_food(@valid_attrs)
    end

    test "create_meal_food/1 with invalid data returns error changeset" do
      assert_raise Postgrex.Error, fn ->
        Meals.create_meal_food(@invalid_attrs)
      end
    end

    test "delete_meal_food/1 deletes the meal_food" do
      meal_food = meal_food_fixture()
      assert {:ok, %MealFood{}} = Meals.delete_meal_food(meal_food)
      assert_raise Ecto.NoResultsError, fn -> Meals.get_meal_food!(@find_attrs) end
    end

    test "get_meal_food!/1 returns the meal_food with given meal_id and food_id" do
      meal_food = meal_food_fixture()
      assert Meals.get_meal_food!(@find_attrs).id == meal_food.id
    end
  end
end
