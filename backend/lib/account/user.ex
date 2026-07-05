defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :display_name, :string
    field :deleted_at, :utc_datetime

    has_many :messages, Backend.Channels.Message, foreign_key: :author_id
    has_many :created_channels, Backend.Channels.Channel, foreign_key: :creator_id
    has_many :channel_participants, Backend.Channels.ChannelParticipant, foreign_key: :user_id
    has_many :channels, through: [:channel_participants, :channel]

    timestamps(type: :utc_datetime)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password_hash, :display_name])
    |> validate_required([:username, :email, :password_hash])
  end
end
