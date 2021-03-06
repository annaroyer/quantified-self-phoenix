defmodule QsPhoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :qs_phoenix,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),

      #Docs
      name: "QsPhoenix",
      source_url: "https://github.com/annaroyer/quantified-self-phoenix",
      homepage_url: "https://annaroyer.github.io/quantified-self-fe",
      docs: [main: "QsPhoenix",
             extras: ["README.md"]
            ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {QsPhoenix.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.1"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:cowboy, "~> 1.0"},
      {:cors_plug, "~> 1.5"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.seed": ["run priv/repo/seeds.exs"],
      "ecto.setup": ["ecto.create --quiet", "ecto.migrate", "ecto.seed"],
      "ecto.reset": ["ecto.drop --quiet", "ecto.setup"],
      "test": ["ecto.reset", "test"]
    ]
  end
end
