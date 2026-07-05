defmodule Backend.Repo.Migrations.Messages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :channel_id, references(:channels, type: :binary_id, on_delete: :delete_all), null: false
      add :author_id, references(:users, type: :binary_id, on_delete: :nothing), null: false
      add :parent_message_id, references(:messages, type: :binary_id)
      add :content, :text
      add :metadata, :string #Not sure the type of metadata
      add :deleted_at, :timestamptz

      timestamps(type: :timestamptz)
    end
  end
end
