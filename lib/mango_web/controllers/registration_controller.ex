defmodule MangoWeb.RegistrationController do
  use MangoWeb, :controller
  alias Mango.CRM

  def new(conn, _) do
    changeset = CRM.build_customer()
    residence_areas = Asgard.ResidenceService.list_areas()
    render(conn, "new.html", changeset: changeset, residence_areas: residence_areas)
  end

  def create(conn, %{"registration" => registration_params}) do
    case CRM.create_customer(registration_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Registration successful")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, changeset} ->
        residence_areas = Asgard.ResidenceService.list_areas()

        conn
        |> render("new.html", changeset: changeset, residence_areas: residence_areas)
    end
  end
end
