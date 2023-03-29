defmodule Chat.Repo.Migrations.CreateAuthUsers do
  use Ecto.Migration

  def change do
    create table(:auth_users) do
      add(:nickname, :string, null: false)

      timestamps()

      unique_index(:auth_users, [:nickname])
    end
  end
end
