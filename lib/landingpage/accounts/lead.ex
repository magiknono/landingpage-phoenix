defmodule Landingpage.Accounts.Lead do
  use Ecto.Schema
  import Ecto.Changeset

  schema "leads" do
    field :code, :string
    field :firstname, :string
    field :lastname, :string
    field :phone, :integer

    timestamps()
  end

  @doc false
  def changeset(lead, attrs) do
    lead
    |> cast(attrs, [:firstname, :lastname, :phone, :code])
    |> validate_required([:firstname, :lastname, :phone, :code])
  end
end
