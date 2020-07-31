defmodule Mango.CatalogTest do
  use ExUnit.Case
  alias Mango.Catalog
  alias Mango.Catalog.Product

  test "list_products/0 returns all products" do
    [p1, p2] = Catalog.list_products()

    assert %Product{} = p1
    assert p1.name == "Tomato"
    assert %Product{} = p2
    assert p2.name == "Apple"
  end
end
