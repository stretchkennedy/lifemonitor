defmodule Lifemonitor.Mixfile do
  use Mix.Project

  def project do
    [app: :lifemonitor,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Lifemonitor, []},
     applications: [:phoenix, :cowboy, :logger, :httpoison]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.11.0"},
     {:cowboy, "~> 1.0"},
     {:oauth2, github: "scrogson/oauth2"},
     {:phoenix_live_reload, "~> 0.3"},
     {:httpoison, "0.6.0"}]
  end
end
