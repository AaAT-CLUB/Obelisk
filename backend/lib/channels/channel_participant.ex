defmodule Backend.Channels.ChannelParticipant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "channel_participants" do
    field :role, Ecto.Enum, values: [:owner, :member]
    field :left_at, :utc_datetime #what happens when they rejoin?

    belongs_to :channel, Backend.Channels.Channel
    belongs_to :user, Backend.Accounts.User

    timestamps(type: :utc_datetime)
  end

end
