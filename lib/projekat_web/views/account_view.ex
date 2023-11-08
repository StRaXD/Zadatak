defmodule ProjekatWeb.AccountView do
  use ProjekatWeb, :view
  alias ProjekatWeb.AccountView

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{
      id: account.id,
      email: account.email,
      password: account.password,
      first_name: account.first_name,
      last_name: account.last_name,
      username: account.username
    }
  end


  def render("account_token.json", %{account: account, token: token}) do
    %{
      id: account.id,
      email: account.email,
      token: token
    }
  end


end
