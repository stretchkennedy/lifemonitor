use Mix.Config


# Watch static and templates for browser reloading.
# *Note*: Be careful with wildcards. Larger projects
# will use higher CPU in dev as the number of files
# grow. Adjust as necessary.
config(:lifemonitor, Lifemonitor.Endpoint,

       watchers: [{Path.expand("node_modules/brunch/bin/brunch"), ["watch"]}],
       code_reloader: true,
       live_reload: [
         patterns: [~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
               ~r{web/views/.*(ex)$},
               ~r{web/templates/.*(eex)$}]],

       http: [port: System.get_env("PORT") || 4000],

       debug_errors: true,
       cache_static_lookup: false,

       oauth2: {OAuth2.Strategy.AuthCode, [
                     client_id: System.get_env("CLIENT_ID"),
                     client_secret: System.get_env("CLIENT_SECRET"),
                     site: "https://www.googleapis.com",
                     authorize_url: "https://accounts.google.com/o/oauth2/auth",
                     token_url: "https://accounts.google.com/o/oauth2/token"]})

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
