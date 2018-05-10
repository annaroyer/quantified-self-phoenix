# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QsPhoenix.QsPhoenix.Repo.insert!(%QsPhoenix.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule QsPhoenix.DatabaseSeeder do
  alias QsPhoenix.Foods

  @foods [%{name: "Banana",calories: 150},
          %{name: "Bagel Bites - Four Cheese", calories: 650},
          %{name: "Chicken Burrito", calories: 800},
          %{name: "Yogurt", calories: 550},
          %{name: "Gum", calories: 50},
          %{name: "Cheese", calories: 400},
          %{name: "Apple", calories: 220}]

  def seed_foods do
    Enum.each(@foods, fn(food) -> Foods.create_food(food) end )
  end
end

QsPhoenix.DatabaseSeeder.seed_foods()
