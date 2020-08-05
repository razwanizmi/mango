defmodule MangoWeb.CheckoutController do
  use MangoWeb, :controller

  def edit(conn, _) do
    render(conn, "edit.html")
  end
end
