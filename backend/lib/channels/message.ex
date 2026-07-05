defmodule Backend.Channels.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "messages" do
    field :content, :string
    field :metadata, :string
    field :type, Ecto.Enum, values: [:system, :user]
    field :deleted_at, :utc_datetime

    belongs_to :channel, Backend.Channels.Channel
    belongs_to :author, Backend.Accounts.User, foreign_key: :author_id
    belongs_to :message, Backend.Channels.Message, foreign_key: :parent_message_id
  end
end
