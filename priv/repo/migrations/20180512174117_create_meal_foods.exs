defmodule QsPhoenix.Repo.Migrations.CreateMealFoods do
  use Ecto.Migration

  def change do
    create table(:meal_foods) do
      add :meal_id, references(:meals, on_delete: :delete_all), null: false
      add :food_id, references(:foods, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:meal_foods, [:meal_id])
    create index(:meal_foods, [:food_id])
  end
end
