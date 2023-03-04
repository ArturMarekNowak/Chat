defmodule Chat.MessengerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chat.Messenger` context.
  """

  @doc """
  Generate a conversation.
  """
  def conversation_fixture(attrs \\ %{}) do
    {:ok, conversation} =
      attrs
      |> Enum.into(%{
        " title: "some \" title"
      })
      |> Chat.Messenger.create_conversation()

    conversation
  end

  @doc """
  Generate a conversation_member.
  """
  def conversation_member_fixture(attrs \\ %{}) do
    {:ok, conversation_member} =
      attrs
      |> Enum.into(%{
        " owner: true
      })
      |> Chat.Messenger.create_conversation_member()

    conversation_member
  end

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        " content: "some \" content"
      })
      |> Chat.Messenger.create_message()

    message
  end

  @doc """
  Generate a emoji.
  """
  def emoji_fixture(attrs \\ %{}) do
    {:ok, emoji} =
      attrs
      |> Enum.into(%{
        code: "some code",
        emoji_id: "some emoji_id"
      })
      |> Chat.Messenger.create_emoji()

    emoji
  end

  @doc """
  Generate a message_reaction.
  """
  def message_reaction_fixture(attrs \\ %{}) do
    {:ok, message_reaction} =
      attrs
      |> Enum.into(%{

      })
      |> Chat.Messenger.create_message_reaction()

    message_reaction
  end

  @doc """
  Generate a seen_message.
  """
  def seen_message_fixture(attrs \\ %{}) do
    {:ok, seen_message} =
      attrs
      |> Enum.into(%{

      })
      |> Chat.Messenger.create_seen_message()

    seen_message
  end
end
