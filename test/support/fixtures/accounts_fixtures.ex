defmodule Projekat.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projekat.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        username: "some username",
        password: "some password",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Projekat.Accounts.create_account()

    account
  end
end
