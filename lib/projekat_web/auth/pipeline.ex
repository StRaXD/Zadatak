defmodule ProjekatWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :projekat,
  module: ProjekatWeb.Auth.Guardian,
  error_handler: ProjekatWeb.Auth.GuardianErrorHandler

 plug Guardian.Plug.VerifySession
 plug Guardian.Plug.VerifyHeader
 plug Guardian.Plug.EnsureAuthenticated
 plug Guardian.Plug.LoadResource

end
