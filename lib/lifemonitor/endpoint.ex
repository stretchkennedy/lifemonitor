defmodule Lifemonitor.Endpoint do
  use Phoenix.Endpoint, otp_app: :lifemonitor

  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Static,
    at: "/", from: :lifemonitor,
    only: ~w(css images js favicon.ico robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_lifemonitor_key",
    signing_salt: "q58D/nYP",
    encryption_salt: "WtB5SwCV"

  plug :router, Lifemonitor.Router
end
