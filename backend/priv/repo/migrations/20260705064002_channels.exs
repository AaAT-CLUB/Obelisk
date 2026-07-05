defmodule Backend.Repo.Migrations.Channels do
  use Ecto.Migration

  def change do
    # no channel_type cuz im lazy
    create table(:channels, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :creator_id, references(:users, type: :binary_id, on_delete: :nothing), null: false
      add :name, :string, null: false
      add :deleted_at, :timestamptz

      timestamps(type: :timestamptz)
    end
  end
end
