alias Chat.Messenger.Conversation
alias Chat.Messenger.SeenMessage
alias Chat.Messenger.MessageReaction
alias Chat.Auth.User

defmodule Chat.Messenger.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_messages" do
    field(:content, :string)

    belongs_to(:conversation, Conversation)
    belongs_to(:user, User)

    has_many(:seen_messages, SeenMessage)
    has_many(:message_reactions, MessageReaction)

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :conversation_id, :user_id])
    |> validate_required([:content, :conversation_id, :user_id])
  end
end
