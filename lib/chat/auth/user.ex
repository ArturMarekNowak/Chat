defmodule Chat.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Pow.Ecto.Schema

  schema "auth_users" do
    field(:nickname, :string)
    field(:email, :string)
    field(:password_hash, :string)

    timestamps()
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
