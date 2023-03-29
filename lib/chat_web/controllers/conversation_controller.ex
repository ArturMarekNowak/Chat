defmodule ChatWeb.ConversationController do
  use ChatWeb, :controller

  alias Chat.Messenger

  require IEx

  plug ChatWeb.AssignUser

  def create(conn, %{"conversation" => params}) do
    # case Chat.create_conversation(%{params})
  end
end
