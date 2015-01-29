use Mix.Config

config(:lifemonitor, Lifemonitor.Endpoint,
       http: [port: System.get_env("PORT") || 4000],
       debug_errors: true,
       cache_static_lookup: false,
       oauth2: {OAuth2.Strategy.AuthCode, [
                     client_id: System.get_env("CLIENT_ID"),
                     client_secret: System.get_env("CLIENT_SECRET"),
                     site: "https://googleapis.com",
                     authorize_url: "https://accounts.google.com/o/oauth2/auth",
                     token_url: "https://accounts.google.com/o/oauth2/auth"]})

# Enables code reloading for development
config :phoenix, :code_reloader, true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
