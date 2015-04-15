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
