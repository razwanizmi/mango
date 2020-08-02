defmodule MangoWeb.Plug.FetchCartTest do
  use MangoWeb.ConnCase
  alias Mango.Sales.Order

  test "create and set cart on first visit" do
    conn = get(build_conn(), "/")

    cart_id = get_session(conn, :cart_id)
    assert %Order{status: "In Cart"} == conn.assigns.cart
    assert cart_id == conn.assigns.cart.id
  end

  test "fetch cart from session on subsequent visit" do
    # First visit
    conn = get(build_conn(), "/")

    # Cart id from first visit
    cart_id = get_session(conn, :cart_id)

    # Second visit
    conn = get(conn, "/")
    assert conn.assigns.cart_id == cart_id
  end
end
