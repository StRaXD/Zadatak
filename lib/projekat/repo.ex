defmodule Projekat.Repo do
  use Ecto.Repo,
    otp_app: :projekat,
    adapter: Ecto.Adapters.Postgres
end
