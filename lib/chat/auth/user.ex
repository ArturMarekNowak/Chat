defmodule Chat.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Pow.Ecto.Schema

  alias Chat.Chat.{ConversationMember}

  schema "auth_users" do
    pow_user_fields()

    field(:nickname, :string)

    has_many :conversation_members, ConversationMember
    has_many :conversations, through: [:conversation_members, :conversation]
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
    |> cast(attrs, [:nickname])
    |> validate_required([:nickname])
    |> unique_constraint(:nickname)
  end
end
