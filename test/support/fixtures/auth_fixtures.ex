defmodule Chat.AuthFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chat.Auth` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        " nickname: "some \" nickname"
      })
      |> Chat.Auth.create_user()

    user
  end
end
