defmodule Projekat.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :password, :string
      add :first_name, :string
      add :last_name, :string
      add :username, :string

      timestamps()
    end
  end
end
