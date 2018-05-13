defmodule QsPhoenix.DatabaseSeeder do
  alias QsPhoenix.Meals.Meal
  alias QsPhoenix.Foods.Food
  alias QsPhoenix.Meals.MealFood
  alias QsPhoenix.Repo

  @foods [%{name: "Banana", calories: 150},
          %{name: "Bagel Bites - Four Cheese", calories: 650},
          %{name: "Chicken Burrito", calories: 800},
          %{name: "Yogurt", calories: 550},
          %{name: "Gum", calories: 50},
          %{name: "Cheese", calories: 400},
          %{name: "Apple", calories: 220}]

  @meals ["Breakfast", "Snack", "Lunch", "Dinner"]

  @meal_foods [[1, 4, 7], [1, 5, 6], [2, 3, 7], [1, 2, 3]]

  def seed do
    seed_foods()
    seed_meals()
    seed_meal_foods()
  end

  def seed_foods do
    Enum.each(@foods, fn(food) ->
      Repo.insert!%Food{name: food.name, calories: food.calories}
    end )
  end

  def seed_meals do
    Enum.map(@meals, fn(name) ->
      Repo.insert!%Meal{ name: name }
    end )
  end

  def seed_meal_foods do
    for {food_ids, meal_id} <- Enum.with_index(@meal_foods) do
      Enum.each(food_ids, fn(food_id) -> create_meal_food(meal_id, food_id) end)
    end
  end

  def create_meal_food(meal_id, food_id) do
    Repo.insert!%MealFood{meal_id: meal_id + 1, food_id: food_id}
  end
end

QsPhoenix.DatabaseSeeder.seed()
