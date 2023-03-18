defmodule Chat.Messenger.Emoji do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_emojis" do
    field(:key, :string)
    field(:unicode, :string)
  end

  @doc false
  def changeset(emoji, attrs) do
    emoji
    |> cast(attrs, [:key, :unicode])
    |> validate_required([:key, :unicode])
  end
end
