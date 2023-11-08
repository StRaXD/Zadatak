# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :projekat,
  ecto_repos: [Projekat.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :projekat, ProjekatWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ProjekatWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Projekat.PubSub,
  live_view: [signing_salt: "ypg9kOML"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :projekat, ProjekatWeb.Auth.Guardian,
  issuer: "insBy_Zadatak",
  secret_key: "7ul+cDsw9ehtsLJ3p3YCnhjpgz6GsitcwdUdRep0yfZfvLYNk1//JfPHz2cbvV1M"


# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
