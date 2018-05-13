defmodule QsPhoenixWeb.MealFoodView do
  use QsPhoenixWeb, :view

  def render("show.json", %{message: message}) do
    %{message: message}
  end
end
