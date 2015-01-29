# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :lifemonitor, Lifemonitor.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XpDG1n7C99JkLHpyJ+Tx1YUOuXbZfUp3RtL+Ny9+EAf4EFCxi+r2VpFwm7vjQc/z",
  debug_errors: false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
