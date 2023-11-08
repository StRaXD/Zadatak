defmodule ProjekatWeb.Router do
  use ProjekatWeb, :router
  use Plug.ErrorHandler

  def handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  def handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  pipeline :auth do
    plug ProjekatWeb.Auth.Pipeline
  end

  scope "/api", ProjekatWeb do
    pipe_through :api
    post "/register", AccountController, :create
    post "/log_in", AccountController, :sign_in
  end

  scope "/api", ProjekatWeb do
    pipe_through [:api, :auth]
    put "/update/:id", AccountController, :update
  end

end
