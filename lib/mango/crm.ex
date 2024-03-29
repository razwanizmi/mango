defmodule Mango.CRM do
  alias Mango.CRM.Customer
  alias Mango.Repo

  def build_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
  end

  def create_customer(attrs) do
    attrs
    |> build_customer()
    |> Repo.insert()
  end

  def get_customer_by_email(email), do: Repo.get_by(Customer, email: email)

  def get_customer_by_credentials(%{"email" => email, "password" => pass}) do
    customer = get_customer_by_email(email)

    cond do
      customer && Pbkdf2.verify_pass(pass, customer.password_hash) ->
        customer

      true ->
        Pbkdf2.no_user_verify()
        :error
    end
  end

  def get_customer_by_id(id), do: Repo.get(Customer, id)
end
