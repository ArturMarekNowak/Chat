defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  plug ChatWeb.AssignUser, preload: :conversations

  def index(conn, opts \\ []) do
    render(conn, "index.html")
  end
end
