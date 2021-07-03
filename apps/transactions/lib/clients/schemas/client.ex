defmodule Transactions.Clients.Schemas.Client do
  @moduledoc """
  schemas table clients
  """
  use Ecto.Schema

  alias Transactions.Accounts.Schemas.Account

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:email, :name]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "clients" do
    field(:name, :string)
    field(:email, :string)
    field(:password, :string)
    has_one(:account, Account)

    timestamps()
  end
end
