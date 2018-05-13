use Mix.Config

config :qs_phoenix, QsPhoenixWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  load_from_system_env: true,
  url: [scheme: "https", host: "morning-headland-81593.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info


# Configure your database
config :qs_phoenix, QsPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("NEW_DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true,
  database: System.get_env("DATABASE"),
  username: System.get_env("USERNAME"),
  password: System.get_env("PASSWORD")
