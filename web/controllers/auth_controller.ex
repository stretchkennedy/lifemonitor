defmodule Lifemonitor.AuthController do
  use Lifemonitor.Web, :controller

  require Logger

  alias OAuth2.AccessToken
  alias OAuth2.Strategy.AuthCode

  @params %{redirect_uri: "http://localhost:4000/auth/callback", scope: "email profile"}
  @token_params Map.merge(%{headers: [{"Accept", "application/json"}]}, @params)

  plug :action

  @doc """
  This action is reached via `/auth` and redirects to the OAuth2 provider
  based on the chosen strategy. The strategy in this example has already
  been stored in `conn.private.oauth2_strategy` in the router's pipeline.
  """
  def index(conn, _params) do
    redirect conn, external: AuthCode.authorize_url(strategy(conn), @params)
  end

  @doc """
  This action is reached via `/auth/callback` is the the callback URL that
  the OAuth2 provider will redirect the user back to with a `code` that will
  be used to request an access token. The access token will then be used to
  access protected resources on behalf of the user.
  """
  def callback(conn, %{"code" => code}) do
    # Exchange an auth code for an access token
    token = AuthCode.get_token!(strategy(conn), code, @token_params)

    # Request the user's data with the access token
    user = AccessToken.get!(token, "/plus/v1/people/me")

    # Store the user in the session under `:current_user` and redirect to /.
    # In most cases, we'd probably just store the user's ID that can be used
    # to fetch from the database. In this case, since this example app has no
    # database, I'm just storing the user map.
    #
    # If you need to make additional resource requests, you may want to store
    # the access token as well.
    conn = put_session(conn, :current_user, user)
    conn = put_session(conn, :access_token, token)
    redirect(conn, to: "/")
  end

  defp strategy(conn), do: conn.private.oauth2_strategy
end
