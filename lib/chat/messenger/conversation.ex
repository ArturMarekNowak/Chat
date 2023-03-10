alias Chat.Messenger.Message
alias Chat.Messenger.ConversationMember

defmodule Chat.Messenger.Conversation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_conversations" do
    field(:title, :string)

    has_many(:conversation_members, ConversationMember)
    has_many(:messages, Message)

    timestamps()
  end

  @doc false
  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
