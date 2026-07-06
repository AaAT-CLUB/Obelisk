defmodule Backend.Channels.ChannelParticipant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "channel_participants" do
    field :role, Ecto.Enum, values: [:owner, :member]
    field :left_at, :utc_datetime #what happens when they rejoin?

    belongs_to :channel, Backend.Channels.Channel, foreign_key: :channel_id
    belongs_to :user, Backend.Accounts.User, foreign_key: :user_id

    timestamps(type: :utc_datetime)
  end

  def changeset(channel_participant, attrs) do
    channel_participant
    |> cast(attrs, [:user, :channel, :role])
    |> validate_required([:user, :channel])
  end
end
