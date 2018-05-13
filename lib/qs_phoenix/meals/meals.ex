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
  def get_meal!(id), do: Repo.get!(Meal, id)

  @doc """
  Updates a meal.

  ## Examples

      iex> update_meal(meal, %{field: new_value})
      {:ok, %Meal{}}

      iex> update_meal(meal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  def update_meal(%Meal{} = meal, attrs) do
    meal
    |> Meal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking meal changes.

  ## Examples

      iex> change_meal(meal)
      %Ecto.Changeset{source: %Meal{}}

  """

  def change_meal(%Meal{} = meal) do
    Meal.changeset(meal, %{})
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
  Deletes a MealFood.

  ## Examples

      iex> delete_meal_food(meal_food)
      {:ok, %MealFood{}}

      iex> delete_meal_food(meal_food)
      {:error, %Ecto.Changeset{}}

  """
  def delete_meal_food(%MealFood{} = meal_food) do
    Repo.delete(meal_food)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking meal_food changes.

  ## Examples

      iex> change_meal_food(meal_food)
      %Ecto.Changeset{source: %MealFood{}}

  """
  def change_meal_food(%MealFood{} = meal_food) do
    MealFood.changeset(meal_food, %{})
  end
end
