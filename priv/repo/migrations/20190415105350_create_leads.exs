defmodule Landingpage.Repo.Migrations.CreateLeads do
  use Ecto.Migration

  def change do
    create table(:leads) do
      add :firstname, :string
      add :lastname, :string
      add :phone, :integer
      add :code, :string

      timestamps()
    end

  end
end
