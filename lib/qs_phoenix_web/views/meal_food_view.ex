defmodule QsPhoenixWeb.MealFoodView do
  use QsPhoenixWeb, :view
  alias QsPhoenixWeb.MealFoodView

  def render("show.json", %{message: message}) do
    %{message: message}
  end
end
