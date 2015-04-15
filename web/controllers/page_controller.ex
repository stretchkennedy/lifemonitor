defmodule Lifemonitor.PageController do
  use Lifemonitor.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
