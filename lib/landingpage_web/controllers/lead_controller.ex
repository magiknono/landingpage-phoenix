defmodule LandingpageWeb.LeadController do
  use LandingpageWeb, :controller

  alias Landingpage.Accounts
  alias Landingpage.Accounts.Lead

  def index(conn, _params) do
    leads = Accounts.list_leads()
    render(conn, "index.html", leads: leads)
  end

  def new(conn, _params) do
    changeset = Accounts.change_lead(%Lead{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lead" => lead_params}) do
    case Accounts.create_lead(lead_params) do
      {:ok, lead} ->
        conn
        |> put_flash(:info, "Lead created successfully.")
        |> redirect(to: Routes.lead_path(conn, :show, lead))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lead = Accounts.get_lead!(id)
    render(conn, "show.html", lead: lead)
  end

  def edit(conn, %{"id" => id}) do
    lead = Accounts.get_lead!(id)
    changeset = Accounts.change_lead(lead)
    render(conn, "edit.html", lead: lead, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lead" => lead_params}) do
    lead = Accounts.get_lead!(id)

    case Accounts.update_lead(lead, lead_params) do
      {:ok, lead} ->
        conn
        |> put_flash(:info, "Lead updated successfully.")
        |> redirect(to: Routes.lead_path(conn, :show, lead))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lead: lead, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lead = Accounts.get_lead!(id)
    {:ok, _lead} = Accounts.delete_lead(lead)

    conn
    |> put_flash(:info, "Lead deleted successfully.")
    |> redirect(to: Routes.lead_path(conn, :index))
  end
end
