defmodule Backend.Repo.Migrations.ChannelParticipants do
  use Ecto.Migration

  def change do
    create table(:channel_participants, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :channel_id, references(:channels, type: :binary_id, on_delete: :delete_all), null: false
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false
      add :role, :string
      add :left_at, :timestamptz

      timestamps(type: :timestamptz)
    end
  end
end
