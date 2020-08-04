defmodule MangoWeb.LayoutView do
  use MangoWeb, :view
  import MangoWeb.CartView, only: [cart_count: 1, cart_link_text: 1]
end
