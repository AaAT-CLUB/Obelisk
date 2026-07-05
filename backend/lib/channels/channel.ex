defmodule Backend.Channels.Channel do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "channels" do
    field :name, :string
    field :deleted_at, :utc_datetime

    belongs_to :creator, Backend.Accounts.User, foreign_key: :creator_id
    has_many :channel_participants, Backend.Channels.ChannelParticipant, foreign_key: :channel_id
    has_many :users, through: [:channel_participants, :user]

    timestamps(type: :utc_datetime)
  end
end
