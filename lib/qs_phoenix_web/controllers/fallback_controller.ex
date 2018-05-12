defmodule QsPhoenixWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use QsPhoenixWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    send_resp(conn, :bad_request, "")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
  end
end
