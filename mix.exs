defmodule LiveDoomFire.Mixfile do
  use Mix.Project

  def project do
    [
      app: :live_doom_fire,
      version: "0.0.1",
      elixir: "~> 1.10",
      description: "Demo of using LiveView to render DOOM's fire",
      package: [
        licenses: ["MIT"],
        links: [],
      ],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {LiveDoomFire.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:plug_cowboy, "~> 2.3"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.18"},
      {:cowboy, "~> 2.8"},
      {:jason, "~> 1.2"},
      {:phoenix_live_view, "~> 0.14"},
      {:distillery, "~> 1.5"}
    ]
  end

  defp aliases do
    [
      test: ["test"]
    ]
  end
end
