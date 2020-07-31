defmodule Mango.CatalogTest do
  use ExUnit.Case
  alias Mango.Catalog
  alias Mango.Catalog.Product

  test "list_products/0 returns all products" do
    [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products()

    assert p1.name == "Tomato"
    assert p2.name == "Apple"
  end
end
