alias Chat.Auth.User
alias Chat.Messenger.Emoji
alias Chat.Messenger.Message

defmodule Chat.Messenger.MessageReaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_message_reactions" do
    belongs_to(:user, User)
    belongs_to(:emoji, Emoji)
    belongs_to(:message, Message)

    timestamps()
  end

  @doc false
  def changeset(message_reaction, attrs) do
    message_reaction
    |> cast(attrs, [:user_id, :emoji_id, :message_id])
    |> validate_required([:user_id, :emoji_id, :message_id])
    |> unique_constraint(:emoji_id,
      name: :chat_message_reactions_user_id_message_id_emoji_id_index
    )
  end
end
