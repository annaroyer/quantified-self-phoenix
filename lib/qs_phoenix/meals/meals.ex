defmodule QsPhoenix.Meals do
  @moduledoc """
  The Meals context.
  """

  import Ecto.Query, warn: false
  alias QsPhoenix.Repo

  alias QsPhoenix.Meals.{Meal, MealFood}

  @doc """
  Returns the list of meals.

  ## Examples

      iex> list_meals()
      [%Meal{}, ...]

  """
  def list_meals do
    Repo.all(Meal)
    |> Repo.preload(:foods)
  end

  @doc """
  Gets a single meal.

  Raises `Ecto.NoResultsError` if the Meal does not exist.

  ## Examples

      iex> get_meal!(123)
      %Meal{}

      iex> get_meal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_meal!(id) do
    Repo.get!(Meal, id)
    |> Repo.preload(:foods)
  end

  alias QsPhoenix.Meals.MealFood

  @doc """
  Creates a meal_food.

  ## Examples

      iex> create_meal_food(%{field: value})
      {:ok, %MealFood{}}

      iex> create_meal_food(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_meal_food(attrs \\ %{}) do
    %MealFood{}
    |> MealFood.changeset(attrs)
    |> Repo.insert()
  end


  @doc """
  Gets a single meal_food.

  Raises `Ecto.NoResultsError` if the MealFood does not exist.

  ## Examples

      iex> get_meal_food!(123)
      %Meal{}

      iex> get_meal_food!(456)
      ** (Ecto.NoResultsError)

  """
  def get_meal_food!(attrs) do
    Repo.one!(from MealFood, where: ^attrs, preload: [:food, :meal])
  end

  @doc """
  Deletes a MealFood.

  ## Examples

      iex> delete_meal_food(meal_food)
      {:ok, %MealFood{}}

      iex> delete_meal_food(meal_food)
      {:error, %Ecto.Changeset{}}

  """

  def delete_meal_food(%MealFood{} = meal_food) do
    Repo.delete meal_food
  end
end
