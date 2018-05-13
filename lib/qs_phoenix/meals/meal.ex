defmodule QsPhoenix.Meals.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  alias QsPhoenix.Foods.Food

  schema "meals" do
    field :name, :string

    timestamps()

    many_to_many :foods, Food, join_through: "meal_foods"
  end

  @doc false
  def changeset(meal, attrs) do
    meal
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
