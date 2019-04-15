defmodule Landingpage.Repo do
  use Ecto.Repo,
    otp_app: :landingpage,
    adapter: Ecto.Adapters.Postgres
end
