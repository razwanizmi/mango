defmodule Mango.Sales.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mango.Sales.{Order, LineItem}

  schema "orders" do
    field :status, :string
    field :total, :decimal
    embeds_many :line_items, LineItem, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :total])
    |> cast_embed(:line_items, with: &LineItem.changeset/2)
    |> set_total_order()
    |> validate_required([:status, :total])
  end

  defp set_total_order(changeset) do
    items = get_field(changeset, :line_items)

    total =
      Enum.reduce(items, Decimal.new(0), fn item, acc ->
        Decimal.add(acc, item.total)
      end)

    changeset |> put_change(:total, total)
  end
end
