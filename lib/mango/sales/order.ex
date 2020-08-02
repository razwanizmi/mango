defmodule Mango.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :line_items, {:array, :map}
    field :status, :string
    field :total, :decimal

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :total, :line_items])
    |> validate_required([:status, :total, :line_items])
  end
end
