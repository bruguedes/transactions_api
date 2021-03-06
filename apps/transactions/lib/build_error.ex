defmodule Transactions.BuildError do
  @moduledoc """
  Module for build message error
  """
  @keys [:status, :result]
  @enforce_keys @keys

  @derive {Jason.Encoder, only: [:result]}
  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def changeset(result), do: build(:bad_request, result)
  def user_not_found, do: build(:not_found, "user not found")

  # def get_cep_error(status, result), do: build(status, result)
end
