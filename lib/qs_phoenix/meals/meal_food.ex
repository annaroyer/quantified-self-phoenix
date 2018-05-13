defmodule QsPhoenix.Meals.MealFood do
  use Ecto.Schema
  import Ecto.Changeset

  alias QsPhoenix.Meals.{MealFood, Meal}
  alias QsPhoenix.Foods.Food

  schema "meal_foods" do
    belongs_to :meal, Meal
    belongs_to :food, Food

    timestamps()
  end

  @doc false
  def changeset(meal_food, attrs) do
    meal_food
    |> cast(attrs, [])
    |> validate_required([])
  end
end
