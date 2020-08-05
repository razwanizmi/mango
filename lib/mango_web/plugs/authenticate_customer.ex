defmodule MangoWeb.Plugs.AuthenticateCustomer do
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  alias MangoWeb.Router.Helpers, as: Routes

  def init(_opts), do: nil

  def call(conn, _opts) do
    case conn.assigns.current_customer do
      nil ->
        conn
        |> put_flash(:info, "You must be signed in")
        |> redirect(to: Routes.session_path(conn, :create))
        |> halt()

      _ ->
        conn
    end
  end
end
