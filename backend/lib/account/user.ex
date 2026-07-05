defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :diplay_name, :string

    has_many :messages, Backend.Channels.Message
    has_many :channels, Backend.Channels.Channel, foreign_key: :creator_id
    has_many :channel_participants, Backend.Channels.ChannelParticipant

    timestamps(type: :utc_datetime)
  end
end
