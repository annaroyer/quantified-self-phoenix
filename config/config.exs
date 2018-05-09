# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :qs_phoenix,
  ecto_repos: [QsPhoenix.Repo]

# Configures the endpoint
config :qs_phoenix, QsPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s7lbTT9aMnwdXl0Hh5WjA1Sn4l4+Evxox7tEcQUUdovdQJRF4FWDBZWP94ExmR1K",
  render_errors: [view: QsPhoenixWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: QsPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
