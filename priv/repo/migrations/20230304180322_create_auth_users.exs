defmodule Chat.Repo.Migrations.CreateAuthUsers do
  use Ecto.Migration

  def change do
    create table(:auth_users) do
      add(:nickname, :string, null: false)

      unique_index(:auth_users, [:nickname])
    end
  end
end
