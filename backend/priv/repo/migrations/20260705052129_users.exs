defmodule Backend.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :username, :string, size: 32, null: false
      add :display_name, :string, size: 32
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :deleted_at, :timestamptz

      timestamps(type: :timestamptz)
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
