defmodule Lifemonitor.Endpoint do
  use Phoenix.Endpoint, otp_app: :lifemonitor

  plug Plug.Static,
    at: "/", from: :lifemonitor

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
