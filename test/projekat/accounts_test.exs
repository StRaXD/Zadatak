defmodule Projekat.AccountsTest do
  use Projekat.DataCase

  alias Projekat.Accounts

  describe "accounts" do
    alias Projekat.Accounts.Account

    import Projekat.AccountsFixtures

    @invalid_attrs %{username: nil, password: nil, email: nil, first_name: nil, last_name: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{username: "some username", password: "some password", email: "some email", first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Account{} = account} = Accounts.create_account(valid_attrs)
      assert account.username == "some username"
      assert account.password == "some password"
      assert account.email == "some email"
      assert account.first_name == "some first_name"
      assert account.last_name == "some last_name"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{username: "some updated username", password: "some updated password", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Account{} = account} = Accounts.update_account(account, update_attrs)
      assert account.username == "some updated username"
      assert account.password == "some updated password"
      assert account.email == "some updated email"
      assert account.first_name == "some updated first_name"
      assert account.last_name == "some updated last_name"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
