defmodule Chat.Messenger do
  @moduledoc """
  The Messenger context.
  """

  import Ecto.Query, warn: false
  alias Chat.Repo

  alias Chat.Messenger.Conversation

  @doc """
  Returns the list of chat_conversations.

  ## Examples

      iex> list_chat_conversations()
      [%Conversation{}, ...]

  """
  def list_chat_conversations do
    Repo.all(Conversation)
  end

  @doc """
  Gets a single conversation.

  Raises `Ecto.NoResultsError` if the Conversation does not exist.

  ## Examples

      iex> get_conversation!(123)
      %Conversation{}

      iex> get_conversation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conversation!(id), do: Repo.get!(Conversation, id)

  @doc """
  Creates a conversation.

  ## Examples

      iex> create_conversation(%{field: value})
      {:ok, %Conversation{}}

      iex> create_conversation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conversation(attrs \\ %{}) do
    %Conversation{}
    |> Conversation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conversation.

  ## Examples

      iex> update_conversation(conversation, %{field: new_value})
      {:ok, %Conversation{}}

      iex> update_conversation(conversation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conversation(%Conversation{} = conversation, attrs) do
    conversation
    |> Conversation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a conversation.

  ## Examples

      iex> delete_conversation(conversation)
      {:ok, %Conversation{}}

      iex> delete_conversation(conversation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conversation(%Conversation{} = conversation) do
    Repo.delete(conversation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conversation changes.

  ## Examples

      iex> change_conversation(conversation)
      %Ecto.Changeset{data: %Conversation{}}

  """
  def change_conversation(%Conversation{} = conversation, attrs \\ %{}) do
    Conversation.changeset(conversation, attrs)
  end

  alias Chat.Messenger.ConversationMember

  @doc """
  Returns the list of chat_conversation_members.

  ## Examples

      iex> list_chat_conversation_members()
      [%ConversationMember{}, ...]

  """
  def list_chat_conversation_members do
    Repo.all(ConversationMember)
  end

  @doc """
  Gets a single conversation_member.

  Raises `Ecto.NoResultsError` if the Conversation member does not exist.

  ## Examples

      iex> get_conversation_member!(123)
      %ConversationMember{}

      iex> get_conversation_member!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conversation_member!(id), do: Repo.get!(ConversationMember, id)

  @doc """
  Creates a conversation_member.

  ## Examples

      iex> create_conversation_member(%{field: value})
      {:ok, %ConversationMember{}}

      iex> create_conversation_member(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conversation_member(attrs \\ %{}) do
    %ConversationMember{}
    |> ConversationMember.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conversation_member.

  ## Examples

      iex> update_conversation_member(conversation_member, %{field: new_value})
      {:ok, %ConversationMember{}}

      iex> update_conversation_member(conversation_member, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conversation_member(%ConversationMember{} = conversation_member, attrs) do
    conversation_member
    |> ConversationMember.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a conversation_member.

  ## Examples

      iex> delete_conversation_member(conversation_member)
      {:ok, %ConversationMember{}}

      iex> delete_conversation_member(conversation_member)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conversation_member(%ConversationMember{} = conversation_member) do
    Repo.delete(conversation_member)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conversation_member changes.

  ## Examples

      iex> change_conversation_member(conversation_member)
      %Ecto.Changeset{data: %ConversationMember{}}

  """
  def change_conversation_member(%ConversationMember{} = conversation_member, attrs \\ %{}) do
    ConversationMember.changeset(conversation_member, attrs)
  end

  alias Chat.Messenger.Message

  @doc """
  Returns the list of chat_messages.

  ## Examples

      iex> list_chat_messages()
      [%Message{}, ...]

  """
  def list_chat_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end

  alias Chat.Messenger.Emoji

  @doc """
  Returns the list of chat_emojis.

  ## Examples

      iex> list_chat_emojis()
      [%Emoji{}, ...]

  """
  def list_chat_emojis do
    Repo.all(Emoji)
  end

  @doc """
  Gets a single emoji.

  Raises `Ecto.NoResultsError` if the Emoji does not exist.

  ## Examples

      iex> get_emoji!(123)
      %Emoji{}

      iex> get_emoji!(456)
      ** (Ecto.NoResultsError)

  """
  def get_emoji!(id), do: Repo.get!(Emoji, id)

  @doc """
  Creates a emoji.

  ## Examples

      iex> create_emoji(%{field: value})
      {:ok, %Emoji{}}

      iex> create_emoji(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_emoji(attrs \\ %{}) do
    %Emoji{}
    |> Emoji.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a emoji.

  ## Examples

      iex> update_emoji(emoji, %{field: new_value})
      {:ok, %Emoji{}}

      iex> update_emoji(emoji, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_emoji(%Emoji{} = emoji, attrs) do
    emoji
    |> Emoji.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a emoji.

  ## Examples

      iex> delete_emoji(emoji)
      {:ok, %Emoji{}}

      iex> delete_emoji(emoji)
      {:error, %Ecto.Changeset{}}

  """
  def delete_emoji(%Emoji{} = emoji) do
    Repo.delete(emoji)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking emoji changes.

  ## Examples

      iex> change_emoji(emoji)
      %Ecto.Changeset{data: %Emoji{}}

  """
  def change_emoji(%Emoji{} = emoji, attrs \\ %{}) do
    Emoji.changeset(emoji, attrs)
  end

  alias Chat.Messenger.MessageReaction

  @doc """
  Returns the list of chat_message_reactions.

  ## Examples

      iex> list_chat_message_reactions()
      [%MessageReaction{}, ...]

  """
  def list_chat_message_reactions do
    Repo.all(MessageReaction)
  end

  @doc """
  Gets a single message_reaction.

  Raises `Ecto.NoResultsError` if the Message reaction does not exist.

  ## Examples

      iex> get_message_reaction!(123)
      %MessageReaction{}

      iex> get_message_reaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message_reaction!(id), do: Repo.get!(MessageReaction, id)

  @doc """
  Creates a message_reaction.

  ## Examples

      iex> create_message_reaction(%{field: value})
      {:ok, %MessageReaction{}}

      iex> create_message_reaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message_reaction(attrs \\ %{}) do
    %MessageReaction{}
    |> MessageReaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message_reaction.

  ## Examples

      iex> update_message_reaction(message_reaction, %{field: new_value})
      {:ok, %MessageReaction{}}

      iex> update_message_reaction(message_reaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message_reaction(%MessageReaction{} = message_reaction, attrs) do
    message_reaction
    |> MessageReaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message_reaction.

  ## Examples

      iex> delete_message_reaction(message_reaction)
      {:ok, %MessageReaction{}}

      iex> delete_message_reaction(message_reaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message_reaction(%MessageReaction{} = message_reaction) do
    Repo.delete(message_reaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message_reaction changes.

  ## Examples

      iex> change_message_reaction(message_reaction)
      %Ecto.Changeset{data: %MessageReaction{}}

  """
  def change_message_reaction(%MessageReaction{} = message_reaction, attrs \\ %{}) do
    MessageReaction.changeset(message_reaction, attrs)
  end

  alias Chat.Messenger.SeenMessage

  @doc """
  Returns the list of chat_seen_messages.

  ## Examples

      iex> list_chat_seen_messages()
      [%SeenMessage{}, ...]

  """
  def list_chat_seen_messages do
    Repo.all(SeenMessage)
  end

  @doc """
  Gets a single seen_message.

  Raises `Ecto.NoResultsError` if the Seen message does not exist.

  ## Examples

      iex> get_seen_message!(123)
      %SeenMessage{}

      iex> get_seen_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_seen_message!(id), do: Repo.get!(SeenMessage, id)

  @doc """
  Creates a seen_message.

  ## Examples

      iex> create_seen_message(%{field: value})
      {:ok, %SeenMessage{}}

      iex> create_seen_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_seen_message(attrs \\ %{}) do
    %SeenMessage{}
    |> SeenMessage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a seen_message.

  ## Examples

      iex> update_seen_message(seen_message, %{field: new_value})
      {:ok, %SeenMessage{}}

      iex> update_seen_message(seen_message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_seen_message(%SeenMessage{} = seen_message, attrs) do
    seen_message
    |> SeenMessage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a seen_message.

  ## Examples

      iex> delete_seen_message(seen_message)
      {:ok, %SeenMessage{}}

      iex> delete_seen_message(seen_message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_seen_message(%SeenMessage{} = seen_message) do
    Repo.delete(seen_message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking seen_message changes.

  ## Examples

      iex> change_seen_message(seen_message)
      %Ecto.Changeset{data: %SeenMessage{}}

  """
  def change_seen_message(%SeenMessage{} = seen_message, attrs \\ %{}) do
    SeenMessage.changeset(seen_message, attrs)
  end
end
